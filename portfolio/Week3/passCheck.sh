
       #!/bin/bash 

#read password #variable set for the input password
read -sp 'Enter your current Password :' passwordin
echo ""    
# echo "your input was" $passwordin
echo ""
#echo $passwordin | sha256sum
echo $passwordin | sha256sum > inputcheck.txt
userask=$passwordin
echo ""
#echo "userask hash:"
#echo $userask | sha256sum
userpass=$(<secret.txt)
echo ""
#echo "the file input is: "  
#echo ""
#echo $userpass
echo ""
inputcheck=$(<inputcheck.txt)
#echo "the hash of inputcheck: "  
#echo ""
#echo $inputcheck
#echo ""


#hashpass=$userask
#hashpass=$(sha256sum  secret.txt | awk '{print $1}')
#echo "hashpass:" 
#echo $hashpass    


#file1_hash="$(sha256sum -c "secret.txt")"
#echo $file1_hash    
#echo "$userpass"
    
        if [[ $inputcheck == $userpass ]]; then
                echo "Password Match"
                rm inputcheck.txt
                exit 0
        else
                echo "Password Fail"
                rm inputcheck.txt
                exit 1

        fi
        
        
exit 0