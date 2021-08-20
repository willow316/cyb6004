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
	clear
}
# Purpose - Password check before authorisation into the menu application
function passwordcheck(){
	fail=3
# for loop to time out after 3 cycles to avoid brute force
		for ((i = 1; i < 4; i++))
			do
        
                    #read password #variable set for the input password
                    tput setaf 2;
                    read -p "Please Enter Your Username : " username1
                                                    
                                                userflag=0
                                                while [ $userflag -eq 0 ]
                                                do
                                                username2="${username1}.txt"
                                                    if [[ ! -f $username2 ]]
                                                        then
                                                            tput setaf 1;
                                                            read -p "Incorrect Username - Please Enter Username :" username1
                                                     else
                                                     userflag=1
                                                     fi
                                                done

                                    tput setaf 2;
                                    read -sp 'Enter your current Password :' passwordin
                                    echo ""    
                                    echo ""
                                    #Convert the variable input into sha256 and read out for checking hash
                                    echo $passwordin | sha256sum > inputcheck.txt
                                            userask=$passwordin
                                    echo ""
                                                #Set variable of the hash for users password
                                                        username2="${username1}.txt"
                                                        userpass=$(<$username2)
                                                echo ""
                                                echo ""
                    #read in the details the user entered into passwordin from the hash file it was dumped to in local folder
                    inputcheck=$(<inputcheck.txt)
                            
                            #if statement to check if the users input above (from file writen out line 13)
                            if [[ $inputcheck == $userpass ]]; then
                                    tput setaf 2;
                                    echo "WELCOME TO WEBSCRAPE WORLD!!! "$username1
									echo "Password Match"
                                    #Delete inputcheck file to avoid being exposed
                                    rm inputcheck.txt
									show_menu
									read_input
                                    exit 0
                            else
                                    tput setaf 1;
                                    echo "Password Fail"
                                    tput setaf 5;
                                    let fail=$fail-1
                                    echo "You have --- $fail --- attempts left"
                                    #Delete inputcheck file to avoid being exposed
                                    rm inputcheck.txt
                                    

                            fi
   
			done
			tput setaf 7;
			echo "GOODBYE PLEASE COME AGAIN"
}

# remove the output files to avoid classhes with other menu outputs
function remove (){
	rm cveVendor.txt
	rm cveProduct.txt
	rm cveVulnerabilities.txt
	rm cveAwkfile.txt
	rm cveOS.txt
}

# Purpose - This function will request the user enter their username and password again and allow them to change their password
function setPassword(){
	# First run the function passwordcheck to confirm the user is who they say they are
	passwordcheck
					 read -sp 'New Password :' pass_var
                        echo ""  
                       #The version includes writing both the password AND SHA values to prove ability to write out
                        echo "Password Change for : " $username1
                            
                 echo "$pass_var" | sha256sum > $username1
                        
                        echo ""
                        echo "Thanks for storing your password in our keypass"            
			pause
			show_menu
			read_input
}

# Purpose - This fucntion pulls the main website we are scraping and pushes it to the working cveOS.txt file for scraping
function cveCurl(){

	curl -ks https://www.cvedetails.com/top-50-products.php > cveOS.txt

}

# This function will ask the user to input a year (between 1999 and 2021), this will scrape the specific year for that CVE extract, using a while loop to enforce
function cveCurlYearFilter() {
		url=https://www.cvedetails.com/top-50-products.php?year=

			read -p "Enter Year to Search between 1999 - 2021 : " inputyear

		#While loop will force the user to select a year between 2021 and 1999 to enforce the condition, otherwise the website will print the "ALL YEARS" output

		while [ "$inputyear" -gt 2021  -o "$inputyear" -lt 1999 ]
			do
				echo "Input must be between 1999 and 2021"
				read -p "Enter a year between 1999 - 2021 :" inputyear
    
			done

	#convert the input by combining the URL variable contained above with the input from user to obtain the full URL required for scraping in the cveScrape function
	yearcurl=$url$inputyear

	echo ""
	echo "Scraping :  " $yearcurl

	curl -ks $yearcurl > cveOS.txt
}


# Purpose - This fucntion will use some known formats and regex to extract the Product, Vendor and Vulnerability Numbers from the TOP 50 URL thrown from CVE.sh Curl command
function cveScrape(){

grep /product/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveProduct.txt
grep /vendor/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveVendor.txt
grep /vulnerability-list/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveVulnerabilities.txt

}

# Purpose - # This function will create an array which enables input from the three webscrape commands (pulling Product, Vendor and Vulnerability to be pulled into one delimited ...
# txt file for use with AWK to display on screen automatically
function cveAwkCombine(){

	awk 'FILENAME==ARGV[1] {a[FNR]=$0} FILENAME==ARGV[2] {b[FNR]=$0} FILENAME==ARGV[3] {print ""a[FNR]":",b[FNR]":",$0":"}' cveProduct.txt cveVendor.txt cveVulnerabilities.txt > cveAwkFile.txt

}

#Purpose - This function takes the output of the combined files in function cveAwkCombine and uses AWK to filter the display into three rows spaced using 033[32m%-30s\033[0m (use 30s section)
function cveAwkOutput(){
		tput setaf 7;
		echo "Vulnerabilities"
		echo "-----------------------------------------------------------------------"

		tput setaf 3;
		awk '{sum += $1 } END { print "Total Vulnerabilities : \033[31m" sum }' cveVulnerabilities.txt
		tput setaf 7;

#Prints the output of the plotfile.sh/plotfile.txt file into the screenoutput using the arguments delimiated by :

			awk 'BEGIN {
      
				FS=":"; 
      
				print "_____________________________________________________________________________________________"; 
      
   

				printf("| \033[32m%-30s\033[0m | \033[32m%-20s\033[0m | \033[32m%-20s\033[0m |\n|-----------------------------------|--------------------------|----------------------------|\n", 
				"     Product                     ", "   Vendor               ", "   Vulnerabilities        ");
			}

			{

			printf("| \033[35m%-30s\033[0m    |   \033[33m%-20s\033[0m   | \033[35m%-20s\033[0m       |\n", $1, $2, $3);

			}

			END {

				print("_____________________________________________________________________________________________");

			}' cveAwkFile.txt

}

function cveFilterInputGrep(){

		tput setaf 5;
		echo "Vendor List"
		#Removes Duplicate Vendor Entries
		tput setaf 7;
		awk '!seen[$0]++' cveVendor.txt

		#tput setaf 2;

		#Sets users input search details
		read -p "Enter Your Vendor Search : " inputfilter
		tput setaf 5;
		echo "You Selected: "$inputfilter
		echo ""
							#while ($inputfilter) -------------------------------TO DO

# Extra search criteria for the VENDOR selection using inputfitler

			grep /product/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveProduct.txt
			grep /vendor/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveVendor.txt
			grep /vulnerability-list/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveVulnerabilities.txt

}

# Purpose - This will call the scripts created to run a webscrape from https://www.cvedetails.com/top-50-products.php
function cveFunc(){
	cveCurl
	cveScrape
	cveAwkCombine
	cveAwkOutput
	remove
	pause
	show_menu
	read_input
	pause
}
# Purpose - Search the Scrap File for a specific vendor
function cveVendorFunc(){
	cveCurl
	cveScrape
	cveFilterInputGrep
	cveAwkCombine
	cveAwkOutput
	remove
	show_menu
	read_input
	pause
}

# Purpose - 
function cveYear(){
	cveCurlYear
	cveScrape
	cveAwkCombine
	cveAwkOutput
	remove
	show_menu
	read_input
	pause
}

function cveYearSearch(){
	cveCurlYearFilter
	cveScrape
	cveFilterInputGrep
	cveAwkCombine
	cveAwkOutput
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
		6)  setPassword ;;
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