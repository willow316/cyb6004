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
#	./passCheck.sh
#		if test $? -eq 0 ; then
				show_menu
				read_input
#			else
#			echo "Goodbye"
#		fi
	exit 0
}

# Purpose  - Display a menu on screen
function show_menu(){
	tput setaf 6;
    date
    echo "---------------------------"
    echo "  CALCULATOR"
    echo "---------------------------"
	echo "1. Addition"
	echo "2. Subtraction"
	echo "3. Multiply"
	echo "4. Division"
	echo "5. Exit"

}

# Purpose - Display header message
# $1 - message
function write_header(){
	local h="$@"
	echo "---------------------------------------------------------------"
	echo "     ${h}"
	echo "---------------------------------------------------------------"
}

# Purpose - add two values with BLUE text
function add(){
	tput setaf 3;
				read -p "Value of A = " A
				read -p "Value of B = " B
				((C=A+B))
		echo " A + B = " $C
		echo " $A + $B = " $C
	#pause "Press [Enter] key to continue..."
				show_menu
				read_input
}

# Purpose - 
function sub(){
	tput setaf 2;
				read -p "Value of A = " A
				read -p "Value of B = " B
				((C=A-B))
		echo " A - B = " $C
		echo " $A - $B = " $C
	#pause "Press [Enter] key to continue..."
				show_menu
				read_input
	pause
}

# Purpose - 
function mul(){
	tput setaf 1;
				read -p "Value of A = " A
				read -p "Value of B = " B
				((C=A*B))
		echo " A * B = " $C
		echo " $A * $B = " $C
	#pause "Press [Enter] key to continue..."
				show_menu
				read_input
	pause
}
# Purpose - Get input via the keyboard and make a decision using case..esac 
function div(){
	tput setaf 5;
				read -p "Value of A = " A
				read -p "Value of B = " B
				((C=A/B))
		echo " A / B = " $C
		echo " $A / $B = " $C
	#pause "Press [Enter] key to continue..."
				show_menu
				read_input
	pause
}

# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	read -p "Enter your choice [ 1 - 5 ] " c
	case $c in
		1)	add ;;
		2)	sub ;;
		3)	mul ;;
		4)	div ;;
		5)	echo "GoodBye!"; exit 0 ;;
		*)	
			tput setaf 1;
			echo "Please select between 1 to 5 choice only."
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