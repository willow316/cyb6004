#!/bin/bash 
#set -x

read -p "Please type the URL of the file you wish to download or type 'exit' to quit :" filetodown
echo ""
echo $filetodown
echo ""
read -p "Please the location to save the file :" filelocation
echo ""
#wget -p $filetodown 



wget -e robots=off -r --no-parent /pics https://en.wikipedia.org/wiki/Everton_F.C.#/media/File:Everton_FC_logo.svg

exit 0