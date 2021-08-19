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


# Purpose  - Display a menu on screen
function show_menu(){
    tput setaf 2;
	echo "---------------------------"
	echo "Date and Time : " | date
	tput setaf 7;
    echo "---------------------------"
    echo "   Main Menu"
    echo "---------------------------"
	echo "1. Show All Users"
	echo "2. Filter /bin/bash"
	echo "3. Filter /bin/false"
	echo "4. Filter /usr/sbin/nologin"
	echo "5. Filter /bin.sync"
	echo "6. exit"

}

# Purpose - Display header message
# $1 - message
function write_header(){
	local h="$@"
	echo "---------------------------------------------------------------"
	echo "     ${h}"
	echo "---------------------------------------------------------------"
}

function main(){
	./UserAccountsMain.sh
	#pause "Press [Enter] key to continue..."
	pause
}

# BIN BASH FILTER
function binbash(){
	./UserAccountsBinBash.sh
	#pause "Press [Enter] key to continue..."
	pause
}

# Purpose binfalse filter- 
function binfalse(){
	
	./UserAccountsFALSE.sh
	pause
}

# Purpose binsync filter- 
function sync(){
	./UserAccountsbinSYNC.sh
			pause 
}

# Purpose user/sbin/nologin
function sbinnologin(){
	./UserAccountsSBINNOLOGIN.sh
			pause 
}


# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	tput setaf 2;
	read -p "Enter your choice [ 1 - 6 ] " c
		tput setaf 7;
		case $c in
		1)	main ;;
		2)	binbash ;;
		3)	binfalse ;;
		4)  sbinnologin ;;
		5)  sync ;;
		6)	echo "Bye!"; exit 0 ;;
		*)	
			echo "Please select between 1 to 6 choice only."
			tput setaf 6;
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
show_menu
read_input
done