#username=secret.txtt
#username1="${username}.txt"
read -p "user :" username1

                            
                                                userflag=0
                                                while [ $userflag -eq 0 ]
                                                do
                                                username2="${username1}.txt"
                                                    if [[ ! -f $username2 ]]
                                                        then
                                                            read -p "Incorrect Username - Please Enter Username :" username1
                                                     else
                                                     userflag=1
                                                     fi
                                                done