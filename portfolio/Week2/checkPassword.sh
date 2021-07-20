
       #!/bin/bash 
      
echo "enter the password" 
      
read password 
      
len="${#password}"  # len is used to check the length of a string, password being the variable input by the user
      
if test $len -ge 8 ; then  #if password is greater than 8 the if statement moves to the next logic if not, exit with error in the final 'else'
      
    echo "$password" | grep -q [0-9] # grep is used to search a string in this case checking for numbers 0-9
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep -q [A-Z] 
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep -q [a-z] 
      
    if test $? -eq 0 ; then 
      
    echo "$password" | grep -q [$,@,#,%] 
      
    if test $? -eq 0 ; then 
      
    echo "Strong password" 
      
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
     