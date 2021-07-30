
       #!/bin/bash 
i=0
fail=3
# for loop to time out after 3 cycles to avoid brute force
for ((i = 1; i < 4; i++))
    do
        
                    #read password #variable set for the input password
                    tput setaf 2;
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
                                    tput setaf 2;
                                    echo "Password Match"
                                    rm inputcheck.txt
                                    exit 0
                            else
                                    tput setaf 1;
                                    echo "Password Fail"
                                    tput setaf 5;
                                    let fail=$fail-1
                                    echo "You have --- $fail --- attempts left"
                                    #echo "value of I : "$i
                                    rm inputcheck.txt
                                    #exit 1

                            fi
   
    done
        
exit 0