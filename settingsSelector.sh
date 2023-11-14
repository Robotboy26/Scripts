#!/bin/bash
# Array to store package names
packages=(
    "package1"
    "package2"
    "package3"
)

# Array to store configuration options
options=(
    "option1"
    "option2"
    "option3"
)
echo "Select packages to install:"
for ((i=0; i<${#packages[@]}; i++)); do
    echo "$i. ${packages[$i]}"
done
read -p "Enter package numbers to install (comma-separated): " selected_packages

echo "Select configuration options:"
for ((i=0; i<${#options[@]}; i++)); do
    echo "$i. ${options[$i]}"
done
read -p "Enter option numbers to configure (comma-separated): " selected_options
# Install selected packages
IFS=',' read -ra package_indices <<< "$selected_packages"
for index in "${package_indices[@]}"; do
    package=${packages[$index]}
    echo "Installing package: $package"
    sudo apt-get install $package
done

# Configure selected options
IFS=',' read -ra option_indices <<< "$selected_options"
for index in "${option_indices[@]}"; do
    option=${options[$index]}
    echo "Configuring option: $option"
    # Perform the desired configuration action based on the selected option
    # ...
done
