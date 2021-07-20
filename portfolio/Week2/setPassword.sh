#! /bin/bash

#19/7/2021 16:00 AWST - First version updated to Github (willow316)

#this script will catch a users folder of choice, save the folder name into a varible, output that for confirmation and then create the file
#the script will then move folder locations to the newly created file
#it will then as the user for a password input, hidden from the command line which will be written to secret.txt in the new folder

            #echo "Choose Folder Name: " 
    #read FolderName1
            #echo "Folder Name Selected :"$FolderName1
        #mkdir $FolderName1
        #cd $FolderName1
                    read -sp 'Password :' pass_var
                        echo ""  
                    # Testing line commented out for final version (allowing me to see the outputs) 
                    #echo "Password: " $pass_var

                        #The version includes writing both the password AND SHA values to prove ability to write out, in theory line 20 would be excluded
                        echo "$pass_var" >> secret.txt
                        #echo "$pass_var" | sha256sum >> secret.txt  
                    
                    #Previous testing to work out how to extract the VAR
                    #echo $FolderName1 >> secret.txt
                    #read $FolderName1 > ./Secret.txt
                    #read -p 'Password :' $pass_var 
                    #echo $FolderName1 >> Secret.txt
            echo ""
            echo "Thanks for storing your password in our keypass"

exit 0