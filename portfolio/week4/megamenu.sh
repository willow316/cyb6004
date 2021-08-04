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
	./passwordCheck.sh
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

}

# Purpose - Display header message
# $1 - message
function write_header(){
	local h="$@"
	echo "---------------------------------------------------------------"
	echo "     ${h}"
	echo "---------------------------------------------------------------"
}

# Purpose - 
function createp(){
	./createp.sh
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "error"
	fi
			pause 
}

# Purpose - 
function convertp(){
	./convertp.sh
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "error"
	fi
			pause 
}


# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	tput setaf 3;
	read -p "Enter your choice [ 1 - 3 ] " c
		case $c in
		1)	createp ;;
		2)	convertp ;;
		3)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 3 choice only."
			pause
	esac
	tput setaf 4;
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