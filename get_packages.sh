
installed_packages_list=$(pacman -Qe | awk '!/\y(nvidia|amd|intel|dkms)\y/{print $1}')

echo $installed_packages_list > installed_packages.txt

