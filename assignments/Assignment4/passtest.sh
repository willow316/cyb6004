
       #!/bin/bash 
#Script is designed to take a password input from a user and test it through the follow conditions for security, the script has been tabbed to allow for easier view of the IF loops      
#echo -s "enter the password" 
      
#read password #variable set for the input password
read -sp 'Enter the Password :' password
echo ""    
len="${#password}"  # len is a variable assigned for the password 

#echo $len - testing the output to make sure it
      
#if test $len -ge 8; then
      
    echo "$password" | grep -q [0-9] | grep -q [A-Z] | grep -q [a-z] | grep -q [!@#$%^]
      
        if test $? -eq 0 ; then

        echo "pass test"

        

fi
echo "test 1"

fi
echo "test 2"
      


else 
      
echo "password length should be greater than or equal 8 hence weak password" 
       
exit 0     