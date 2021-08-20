#! /bin/bash

#19/7/2021 16:00 AWST - First version updated to Github (willow316)

#this script will catch a users folder of choice, save the folder name into a varible, output that for confirmation and then create the file
#the script will then move folder locations to the newly created file
#it will then as the user for a password input, hidden from the command line which will be written to secret.txt in the new folder

            
	             read -sp 'Password :' pass_var
                        echo ""  
                       #The version includes writing both the password AND SHA values to prove ability to write out
                        echo "Password Change for : " $username1
                            
                 echo "$pass_var" | sha256sum > $username1
                        
                        echo ""
                        echo "Thanks for storing your password in our keypass"

exit 0