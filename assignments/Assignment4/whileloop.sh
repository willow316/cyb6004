passflag=0
           while [ $passflag -eq 0 ]
               do
                    chk_pass () {
                        echo "$pass_var" | grep -q '[A-Z]' || return 1                        
                        echo "$pass_var" | grep -q '[a-z]' || return 1
                        echo "$pass_var" | grep -q '[0-9]' || return 1
                        # This check specifically uses regex to check for !NOT letters or numbers
                        echo "$pass_var" | grep -q '[^a-zA-Z0-9 \t]' || return 1
                        return 0
                    }

                    echo 'Enter a password containing at least one small letter, one Capital letter, a number and one symbol: '
                    read -r pass_var
                    if chk_pass "$REPLY"; then
                        printf '%s\n' 'Thank you for storing your new password in our keypass'
                        passflag=1
						echo $pass_var
						echo "$pass_var" | sha256sum > secret.txt
                    else
                        $redtext
                        $whiteback
                        echo 'ERROR - please enter a password with at least one small letter, one capital letter, a number and one symbol : '
						read -s pass_var
						$blackback
                    fi

                done