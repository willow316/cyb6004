#!/bin/bash

function show_menu(){
    tput setaf 2;
	echo "---------------------------"
	echo "Date and Time : " | date
	tput setaf 7;
    echo "---------------------------"
    echo "         Main Menu"
    echo "---------------------------"
	echo "1. Random Password"
	echo "2. Covert a Phrase"
	echo "3. Exit"



function choosep()
{ 
echo "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)" 
show_menu
read_input
}

function convert()
{
show_menu
read_input
}

function read_input(){
	local c
	tput setaf 3;
	read -p "Enter your choice [ 1 - 8 ] " c
		case $c in
		1)	choosep ;;
		2)	convert ;;
		3)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 3 choice only."
			pause
	esac
	tput setaf 4;
}

show_menu
read_input
exit 0