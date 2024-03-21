
#!/bin/bash

read -r -p "Enter your email: " email

ssh-keygen -o -t rsa -C "$email"

cat ~/.ssh/id_rsa.pub

while true; do
	read -p "Copy it to github, done? (Y/n): " answer

    if [[ "$answer" == "y" ]]; then
        break
    else
        echo "You need to do this step"
    fi
done

sudo pacman -S --needed base-devel

cd ~/

git clone https://aur.archlinux.org/paru.git

cd paru

makepkg -si

cd ~/setup_scripts

packages_to_install=$(cat installed_packages.txt)

sudo paru -S $packages_to_install

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

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

