#!/bin/bash
#set -x

read -sp "Enter your current Password : " passwordin
echo ""
echo "your input was" $passwordin
echo ""
echo $passwordin | sha256sum | cut -f 1 -d " "
userask=$passwordin
echo ""
echo $userask | sha256sum | cut -f 1 -d " "
userpass=$(<secret.txt)
#echo ""
#echo "the file input is: "
#echo ""
hashpass=$( echo $userask | sha256sum | cut -f 1 -d " ")
#hashpass=$userask | sha256sum | cut -f 1 -d " "
echo "hashpass:"
echo $hashpass
