#!/bin/bash          
module_name=$1
path=Submodules/$module_name

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

if [ -d $path ] 
then
    echo "Error: ${module_name} exists."
else
    echo -e "${GREEN}---- Create ${module_name} ----"

    echo -e "${CYAN}[MAKE PATH]"
    mkdir $path
    mkdir $path/Sources

    echo -e "${CYAN}[MAKE BUCK]"
    touch $path/BUCK
    sed -e "s/__MODULE_NAME__/"${module_name}"/g" scripts/SAMPLE/bucksample > $path/BUCK

    echo -e "${CYAN}[MAKE File] ${module_name}.swift"
    touch $path/Sources/$module_name.swift
    sed -e "s/__MODULE_NAME__/"${module_name}"/g" scripts/SAMPLE/Sample.swift > $path/Sources/$module_name.swift
    echo -e "${GREEN}---- END ----"
fi