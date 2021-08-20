#i=0
fail=3
# for loop to time out after 3 cycles to avoid brute force
		for ((i = 1; i < 4; i++))
			do
        
                    #read password #variable set for the input password
                    tput setaf 2;
                    read -p "Please Enter Your Username : " username1
                                                    
                                                userflag=0
                                                while [ $userflag -eq 0 ]
                                                do
                                                username2="${username1}.txt"
                                                    if [[ ! -f $username2 ]]
                                                        then
                                                            tput setaf 1;
                                                            read -p "Incorrect Username - Please Enter Username :" username1
                                                     else
                                                     userflag=1
                                                     fi
                                                done

                                    tput setaf 2;
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
                                    tput setaf 2;
                                    echo "Username : "$Username1
									echo "Password Match"
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
			tput setaf 7;
			echo "GOODBYE PLEASE COME AGAIN"
	exit 0