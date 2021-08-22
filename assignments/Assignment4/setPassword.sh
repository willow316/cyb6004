#! /bin/bash

#19/7/2021 16:00 AWST - First version updated to Github (willow316)

#this script will catch a users folder of choice, save the folder name into a varible, output that for confirmation and then create the file
#the script will then move folder locations to the newly created file
#it will then as the user for a password input, hidden from the command line which will be written to secret.txt in the new folder

 	fail=3

# for loop to time out after 3 cycles to avoid brute force
		for ((i = 1; i < 4; i++))
			do
        
									$greentext
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
	             


                 read -sp 'Password :' pass_var
                 echo ""
                 regex=$(?=.*[A-Z]) 
                 if [[ $pass_var =~  ]]; then
                        echo "Password confirms to policy"
                 else
                        tput setaf 1;
                        echo "Password does not match policy"
                    fi
                       #The version includes writing both the password AND SHA values to prove ability to write out
                        echo "Password Change for : " $username1
                            
                 echo "$pass_var" | sha256sum > $username1
                        
                        echo ""
                        echo "Thanks for storing your password in our keypass"

exit 0