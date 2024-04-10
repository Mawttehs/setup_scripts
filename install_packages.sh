
#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}$1${NC}"

read -r -p "Do you wish to setup git? (Y/n): " git_prompt

if [ "$git_prompt" = "y" ]; then

    read -r -p "Enter your email: " email

    ssh-keygen -o -t rsa -C "$email"

    cat ~/.ssh/id_rsa.pub

    while true; do
        read -p "Copy it to github, done? (Y/n): " answer

        if [ "$answer" = "y" ]; then
            break
        else
            echo "${RED}!!! YOU NEED TO DO THIS STEP !!!${NC}"
        fi
    done

elif [ "$git_prompt" != "n" ]; then
    exit 1
fi

git config --global user.email "mawtthes@gmail.com"
git config --global user.name "Mawtthes"


./install_packages.sh "${RED}!!! IF YOU ARE SEEING THIS, SKIP THE GIT SETUP !!!${NC}"

sudo pacman -S --needed base-devel

cd ~/

git clone https://aur.archlinux.org/paru.git

cd paru

makepkg -si

cd ~/setup_scripts

packages_to_install=$(cat installed_packages.txt)

paru -S $packages_to_install

cd ~/

git clone git@github.com:Mawttehs/dotfiles.git

rm -r ~/.config/i3
rm -r ~/.config/polybar
rm -r ~/.config/fontconfig
rm -r ~/.config/nvim

ln -s ~/dotfiles/i3-config ~/.config/i3
ln -s ~/dotfiles/polybar ~/.config/polybar
ln -s ~/dotfiles/fontconfig ~/.config/fontconfig
ln -s ~/dotfiles/nvim-setup ~/.config/nvim

chsh -s /usr/bin/fish
sudo chsh -s /usr/bin/fish 

cd ..

git clone git@github.com:gnotclub/xst.git

cd xst

rm ~/xst/config.def.h

ln -s ~/dotfiles/config.def.h ~/xst

sudo make clean install

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

mkdir ~/.config/gtk-3.0/
printf "[Settings]\ngtk-theme-name = Adwaita-dark" > ~/.config/gtk-3.0/settings.ini
printf "[Settings]\ngtk-theme-name = Adwaita-dark" > ~/.config/gtk-4.0/settings.ini



