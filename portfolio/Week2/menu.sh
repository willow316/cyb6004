#!/bin/bash

# Define variables
#LSB=/usr/bin/lsb_release

# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
	local message="$@"
	[ -z $message ] && message="Press [Enter] key to continue..."
	read -p "$message" readEnterKey
}
# Purpose - Password check before authorisation into the menu application
function passwordcheck(){
	./passCheck_1.sh
		if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "Goodbye"
		fi
	exit 0
}

# Purpose  - Display a menu on screen
function show_menu(){
    date
    echo "---------------------------"
    echo "   Main Menu"
    echo "---------------------------"
	echo "1. Create a Folder"
	echo "2. Copy a Folder"
	echo "3. Set a Password"
	echo "4. exit"

}

# Purpose - Display header message
# $1 - message
function write_header(){
	local h="$@"
	echo "---------------------------------------------------------------"
	echo "     ${h}"
	echo "---------------------------------------------------------------"
}

# Purpose - Get info about your operating system
function create(){
	./foldermaker.sh
	if test $? -eq 0 ;then
			echo "Folder Created4"
			show_menu
			read_input
	else
		echo "Error with command please repeat"
			show_menu
			read_input
	fi
	#pause "Press [Enter] key to continue..."
	pause
}

# Purpose - 
function copy(){
	./foldercopier.sh
		pause
}

# Purpose - 
function set(){
	./setPassword.sh
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "Goodbye"
	fi
			pause 
}
# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	read -p "Enter your choice [ 1 - 4 ] " c
	case $c in
		1)	create ;;
		2)	copy ;;
		3)	set ;;
		4)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 4 choice only."
			pause
	esac
}

# ignore CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
	clear
 	passwordcheck	# display memu
 	#read_input  # wait for user input
done