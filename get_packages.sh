
installed_packages_list=$(pacman -Qe)


echo $installed_packages_list > installed_packages.txt

