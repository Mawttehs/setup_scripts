
installed_packages_list=$(pacman -Qe | awk '{print $1}')


result=$(echo "$installed_packages_list" | sed 's/nvidia[^ ]*//g')

echo $result > installed_packages.txt

