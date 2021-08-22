#!/bin/bash

# Define variables
#LSB=/usr/bin/lsb_release

# Global variables
yellowtext='tput setaf 3'
yellowback='tput setb 3'
purpletext='tput setaf 5'
purpleback='tput setb 5'
blueback='tput setaf 4'
bluetext='tput setb 4'
cyantext='tput setaf 6'
cyanback='tput satb 6'
whitetext='tput setaf 7'
greentext='tput setaf 2'
redtext='tput setaf 1'
redback='tput setb 1'
whiteback='tput setb 7'

blackback='tput setb 0'
blacktext='tput setaf 0'
BOLD="\033[1m"

# Purpose: Display pause prompt
function pause(){
	local message="$@"
	$yellowback
	$purpletext
	[ -z $message ] && message="Press [ENTER] to Continue"
	$blackback
	read -p "$message" readEnterKey
	clear
}
# Purpose - Password check before authorisation into the menu application
function passwordcheck(){
	local fail=3
	#read password #variable set for the input password
							  $greentext
                              echo -e -n "Please Enter Your Username : "
							  $whitetext
							  read username1 
                                                userflag=0
                                                while [ $userflag -eq 0 ]
                                                do
                                                username2="${username1}.txt"
                                                    if [[ ! -f $username2 ]]
                                                        then
                                                            #read "${redtext}Incorrect Username - Please Try Again :${greentext}green text"
                                                            $redtext
															$yellowback
															echo -e -n "Incorrect Username - Please Enter Username : "
															$blackback
															$whitetext
															read username1
                                                     else
                                                     userflag=1
                                                     fi
                                                done

# for loop to time out after 3 cycles to avoid brute force
		for ((i = 1; i < 4; i++))
			do
        
									$whiteback
									$blacktext
                                    read -sp 'Enter your current Password :' passwordin
									$blackback
									$whitetext
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
                                    $greentext
                                    echo "Password Match"
									tput setaf 3;
									echo "WELCOME TO WEBSCRAPE WORLD!!! "$username1
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
			$whitetext
			echo "GOODBYE PLEASE COME AGAIN"
			exit 1
}

# Purpose - This function will request the user enter their username and password again and allow them to change their password
function setPassword(){
	# First run the function passwordcheck to confirm the user is who they say they are
	# for loop to time out after 3 cycles to avoid brute force
		fail=3
		for ((i = 1; i < 4; i++))
			do
        
									$greentext
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
                                    $greentext
                                    echo "Password Match"
									tput setaf 3;
									#Delete inputcheck file to avoid being exposed
									rm inputcheck.txt
									setPassword2
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
			$whitetext
			echo "GOODBYE PLEASE COME AGAIN"
			exit 1
	             
			                 
}

setPassword2(){

# read -sp 'Set your new password :' pass_var

			passflag=0
           while [ $passflag -eq 0 ]
               do
                    chk_pass () {
						echo "username in function:" $username1
                        echo "$pass_var" | grep -q '[A-Z]' || return 1                        
                        echo "$pass_var" | grep -q '[a-z]' || return 1
                        echo "$pass_var" | grep -q '[0-9]' || return 1
                        # This check specifically uses regex to check for !NOT letters or numbers
                        echo "$pass_var" | grep -q '[^a-zA-Z0-9 \t]' || return 1
                        return 0
                    }

					$yellowtext
					#echo 'Please enter your username :'
					#$greentext
					#read -r username1
					#echo "username is: "$username1
					$whitetext
                    echo 'Enter a password containing at least one small letter, one Capital letter, a number and one symbol: '
                    #greentext
					read -r pass_var
                    if chk_pass "$REPLY"; then
						$whitetext
                        echo 'Thank you for storing your new password in our keypass'
                        passflag=1
						#echo "username folder check : " $username1

						echo "$pass_var" | sha256sum > $username2
                    else
                        $redtext
                        $yellowback
                        echo 'ERROR - please enter a password with at least one small letter, one capital letter, a number and one symbol : '
						read -s pass_var
						$blackback
                    fi

                done
                        #echo ""  
                       #The version includes writing both the password AND SHA values to prove ability to write out
                        #echo "Password Change for : " $username1
                            
                 
                        
                        #echo ""
                        #echo "Thanks for storing your password in our keypass"         
			pause
			show_menu
			read_input

}

# remove the output files to avoid classhes with other menu outputs
function remove (){
	rm cveVendor.txt
	rm cveProduct.txt
	rm cveVulnerabilities.txt
	rm cveAwkfile.txt
	rm cveOS.txt
}

# Purpose - This fucntion pulls the main website we are scraping and pushes it to the working cveOS.txt file for scraping
function cveCurl(){

	curl -ks https://www.cvedetails.com/top-50-products.php > cveOS.txt

}

# This function will ask the user to input a year (between 1999 and 2021), this will scrape the specific year for that CVE extract, using a while loop to enforce
function cveCurlYearFilter() {
		url=https://www.cvedetails.com/top-50-products.php?year=

			$blueback
			$yellowtext
			read -p "Enter Year to Search between 1999 - 2021 : " inputyear
			$blackback

		#While loop will force the user to select a year between 2021 and 1999 to enforce the condition, otherwise the website will print the "ALL YEARS" output

		while [ "$inputyear" -gt 2021  -o "$inputyear" -lt 1999 ]
			do
				
				$redtext
				$yellowback
				read -p "Please ONLY Enter a year between 1999 - 2021 :" inputyear
				$blackback
    
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
		$whitetext
		echo "Vulnerabilities"
		echo "-----------------------------------------------------------------------"

		tput setaf 3;
		awk '{sum += $1 } END { print "Total Vulnerabilities : \033[31m" sum }' cveVulnerabilities.txt
		$whitetext

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
		$whitetext
		awk '!seen[$0]++' cveVendor.txt
		$yellowtext
		#Sets users input search details
		read -p "Enter Your Vendor Search : " inputfilter
		tput setaf 5;
		echo "You Selected: "$inputfilter
		echo ""
							 # While loop to ensure a vendor in the list is entered using a flag until correct
                                                inputflag=0
                                                while [ $inputflag -eq 0 ]
                                                do
                                                
                                                            if grep -Fxq $inputfilter cveVendor.txt
                                                                then
                                                                 intputflag=1
                                                                 break
                                                             else
															 $redtext
                                                             read -p "Incorrect Vendor - Please Enter correct Vendor :" inputfilter
                                                     
                                                             fi
                                                done

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
	pause
	show_menu
	read_input
	pause
}

# Purpose - 
function cveYear(){
	cveCurlYearFilter
	cveScrape
	cveAwkCombine
	cveAwkOutput
	remove
	pause
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
    $greentext
	echo "---------------------------"
	echo "Date and Time : " | date
	$yellow
    echo "---------------------------"
    echo "   Main Menu"
    echo "---------------------------"
	tput setaf 5;
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
		$blacktext
		$whiteback
	read -p "Enter your choice [ 1 - 7 ] " c
		$blackback
						case $c in
							1)	cveFunc ;;
							2)	cveVendorFunc ;;
							3)	cveYear ;;
							4)	cveYearSearch ;;
							5)	graph ;;
							6)  setPassword ;;
							7)	echo "Thanks for Using WebScaper"; exit 0 ;;
							*)	
			$blacktext
			$whiteback
			echo "Please select an option between 1 and 7 only."
			$blackback
			pause
			show_menu
			read_input
	esac
}


# ignore CTRL+C, CTRL+Z and quit singles using the trap
trap '' SIGINT SIGQUIT SIGTSTP

# main logic
while true
do
	passwordcheck	# display memu
 	#read_input  # wait for user input
done