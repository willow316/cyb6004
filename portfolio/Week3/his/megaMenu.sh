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
	./passCheck.sh
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
    echo "   Main Menu"
    echo "---------------------------"
	echo "1. Create a Folder"
	echo "2. Copy a Folder"
	echo "3. Set a Password"
	echo "4. Calculator"
	echo "5. Creat Weekly Folders"
	echo "6. Check Filenames"
	echo "7. Download a File"
	echo "8. exit"

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
	./folderCreator.sh
	if test $? -eq 0 ;then
			#echo "Folder $folderglobal was created!"
			echo ""
			show_menu
			read_input
	else
		tput setaf 9;
		echo "Error with command please repeat"
		tput setaf 5;
			show_menu
			read_input
	fi
	#pause "Press [Enter] key to continue..."
	pause
}

# Purpose - 
function copy(){
	./folderCopier.sh
		if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "Goodbye"
	fi
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

# Purpose - 
function calc(){
	./calculator.sh
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "error"
	fi
			pause 
}

# Purpose - 
function weekly(){
	./megafoldermaker.sh
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "failure"
	fi
			pause 
}

# Purpose - 
function check(){
	
	read -p "Enter full filename to check :" filecheck
	#loop if no file exists ----------------------------------------------
	./filenames.sh $filecheck
	if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "Goodbye"
	fi
			pause 
}

# Purpose - 
function download(){
	./InternetDownloader.sh
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
	tput setaf 3;
	read -p "Enter your choice [ 1 - 8 ] " c
		case $c in
		1)	create ;;
		2)	copy ;;
		3)	set ;;
		4)  calc ;;
		5)  weekly ;;
		6)  check ;;
		7)  download ;;
		8)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 8 choice only."
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