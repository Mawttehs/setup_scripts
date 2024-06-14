
installed_packages_list=$(pacman -Qe | awk '!/\y(nvidia|amd|intel|dkms|steam|lx|gnome|xonotic|xscreensaver)\y/{print $1}')

echo $installed_packages_list > installed_packages.txt

