
       #!/bin/bash 
#Script is designed to take a password input from a user and test it through the follow conditions for security, the script has been tabbed to allow for easier view of the IF loops      
#echo -s "enter the password" 
      
#read password #variable set for the input password
read -sp 'Enter the Password :' password
echo ""    
len="${#password}"  # len is a variable assigned for the password 

#echo $len - testing the output to make sure it
      
if test $len -ge 8; then  #test is used to set an output condition 0=true / 1=false , could use [  ]
      
    echo "$password" | grep -q [0-9] # grep is used to search the string in this case checking for numbers 0-9 (using an array) -q is slient (not printed)
      
        if test $? -eq 0 ; then #$? - is checking if the last command exit was 0 (or correct), if the command fails it = 1
      
        echo "$password" | grep -q [A-Z] # grep is used to search the string in this case checking for CAPS (using an array), it will store a 0 if +ve which plays into the next test cmd
      
            if test $? -eq 0 ; then 
      
            echo "$password" | grep -q [a-z] # grep is used to search the string in this case checking for lowercase (using an array)
      
                if test $? -eq 0 ; then 
      
                echo "$password" | grep -q [$,@,#,%] # grep is used to search the string in this case checking for 4 special symbols (using an array)
      
                    if test $? -eq 0 ; then 
      
                          echo "Strong password"   
                          #if all conditions are met then the if statement prints this and will end at line 59 otherwise each if statement will step through from above
      
                else 
      
                echo "weak password include special chars" 
      
                fi 
      
            else 
      
            echo "weak password include lower case char" 
      
            fi 
      
        else 
      
        echo "weak password include capital char" 
      
        fi 
      
    else 
      
    echo "please include the numbers in password it is weak password" 
      
    fi 
      
else 
      
echo "password length should be greater than or equal 8 hence weak password" 
      
fi 
     