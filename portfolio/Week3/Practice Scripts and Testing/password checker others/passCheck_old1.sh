#!/bin/bash
set -x

read -sp "Enter your current Password : " passwordin
echo ""
echo ""
echo "your input was"
echo ""
echo $passwordin #| sha256sum | cut -f 1 -d " "
#userask=$passwordin | sha256sum | cut -f 1 -d " "
echo ""
#echo $userask | sha256sum | cut -f 1 -d " "
userpass=$(<secret.txt)
echo ""
echo "userpass: "
echo ""
echo $userpass
echo ""
echo "hashpass: "
echo ""
hashpass=$( echo $passwordin | sha256sum | cut -f 1 -d " ")
#hashpass=$userask | sha256sum | cut -f 1 -d " "
#echo "hashpass:"
echo $hashpass
        if [[ $hashpass == $userpass ]]; then
                echo "" 
                echo "Password Match"
                exit 0
        else
                echo ""
                echo "Password Fail"
                exit 1

        fi
exit 0
