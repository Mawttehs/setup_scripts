
installed_packages_list=$(pacman -Qe | awk '!/nvidia|amd|intel/{print $1}')

echo $installed_packages_list > installed_packages.txt

