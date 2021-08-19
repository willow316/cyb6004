#!/bin/bash

# Define variables
#LSB=/usr/bin/lsb_release

# Purpose: Display pause prompt
# $1-> Message (optional)
function pause(){
	local message="$@"
	tput setaf 3;
	[ -z $message ] && message="Press [ENTER] to Continue"
	read -p "$message" readEnterKey
}
# Purpose - Password check before authorisation into the menu application
function passwordcheck(){
	./passwordCheck.sh
		if test $? -eq 0 ; then
				show_menu
				read_input
			else
			echo "Please Try Again!"
		fi
	exit 0
}
# remove the output files to avoid classhes with other menu outputs
function remove (){
	rm cveVendor.txt
	rm cveProduct.txt
	rm cveVulnerabilities.txt
	rm cveAwkfile.txt
	rm cveOS.txt
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
# Purpose  - Display a menu on screen
function show_menu(){
    tput setaf 2;
	echo "---------------------------"
	echo "Date and Time : " | date
	tput setaf 5;
    echo "---------------------------"
    echo "   Main Menu"
    echo "---------------------------"
	echo "1. Webscrape CVE TOP 50 Website"
	echo "2. Webscrape CVE TOP 50 Website - Search by Vendor"
	echo "3. Webscrape CVE TOP 50 Website - Search by Year"
	echo "4. Webscrape CVE TOP 50 Website - Search by Year Filter Vendor"
	echo "5. Webscrape CVE TOP 50 Website - Graphical Output"
	echo "6  Reset Password"
	echo "7. exit"

}

# Purpose - This will call the scripts created to run a webscrape from https://www.cvedetails.com/top-50-products.php

function cveFunc(){
	./cveCurl.sh
	./cveScrape.sh
	./cveAwkCombine.sh
	./cveAwkOutput.sh
	remove
	if test $? -eq 0 ;then
			pause
			show_menu
			read_input
	else
		echo "Error with command please repeat"
			show_menu
			read_input
	fi
	#pause function
	pause
}
# Purpose - Search the Scrap File for a specific vendor
function cveVendorFunc(){
	./cveUserInFilter.sh
	./cveScrape.sh
	./cveFilterInputGrep.sh
	./cveAwkCombine.sh
	./cveAwkOutput.sh  
	remove


	if test $? -eq 0 ;then
			pause
			show_menu
			read_input
	else
		echo "Error with command please repeat"
			show_menu
			read_input
	fi
	#pause function
	pause
}

# Purpose - 
function cveYear(){
	./cveCurlYear.sh
	./cveScrape.sh
	./cveAwkCombine.sh
	./cveAwkOutput.sh
	remove
	if test $? -eq 0 ;then
			pause
			show_menu
			read_input
	else
		echo "Error with command please repeat"
			show_menu
			read_input
	fi
	#pause function
	pause
}

function cveYearSearch(){
	./cveCurlYearFilter.sh
	./cveScrape.sh
	./cveFilterInputGrep.sh
	./cveAwkCombine.sh
	./cveAwkOutput.sh
	#remove

	if test $? -eq 0 ;then
			pause
			show_menu
			read_input
	else
		echo "Error with command please repeat"
			show_menu
			read_input
	fi
	#pause function
	pause
}


# Purpose - Get input via the keyboard and make a decision using case..esac 
function read_input(){
	local c
	tput setaf 2;
	read -p "Enter your choice [ 1 - 7 ] " c
	tput setaf 2;
	case $c in
		1)	cveFunc ;;
		2)	cveVendorFunc ;;
		3)	cveYear ;;
		4)	cveYearSearch ;;
		5)	graph ;;
		6)  set ;;
		7)	echo "Thanks - Have a Nice Day!"; exit 0 ;;
		*)	
			echo "Please select entering an option between 1 and 6 only."
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