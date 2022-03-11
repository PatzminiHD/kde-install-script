#!/bin/bash
echo Upgrading System...
sudo apt update && sudo pkcon -y update
echo Finished!
echo

echo Installing: terminator, KeePassXC, htop, calc, gparted, neofetch, cmatrix, gimp, tty-clock, mpv, libreoffice, pv, torbrowser-launcher
sudo apt install -y terminator keepass2 htop calc gparted neofetch cmatrix gimp tty-clock mpv libreoffice pv torbrowser-launcher &>/dev/null
echo Finished!
echo

echo Installing: zsh, zsh-syntax-highlighting, autojump, zsh-autosuggestions
sudo apt install -y zsh zsh-syntax-highlighting autojump zsh-autosuggestions
echo Finished!
echo

echo Setting up ZSH
touch "$HOME/.cache/zshhistory"
cd $HOME/Downloads
mkdir git
cd git
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
sudo chsh --shell /bin/zsh $USER
echo Finished!
echo

echo Starting Terminator
echo You can close this window now...
terminator &
disown %1
