
       #!/bin/bash 

#read password #variable set for the input password
read -sp 'Enter your current Password :' passwordin
echo ""    
userask="$passwordin"  # len is a variable assigned for the password 
userpass=$(<secret.txt)
#echo "$userpass"
    
        if [[ $passwordin == $userpass ]]; then
                echo "Password Match"
                exit 0
        else
                echo "Password Fail"
                exit 1

        fi
exit 0