#! /bin/bash

            echo "Choose Folder Name: " 
    read FolderName1
            echo "Folder Name Selected :"$FolderName1
        mkdir $FolderName1
       cd $FolderName1
    read -sp 'Password :' pass_var
    echo ""   
    echo "Password: "$pass_var
    echo "$pass_var" >> secret.txt  
    #echo $FolderName1 >> secret.txt
    #read $FolderName1 > ./Secret.txt
    #read -p 'Password :' $pass_var 
    #echo $FolderName1 >> Secret.txt
    echo ""
    echo "Thanks for storing your password in our keypass"

exit 0