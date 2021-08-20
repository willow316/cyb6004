#!/bin/bash 
      
#hidden password hash 
      
passwordHash="2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824";

# passwordHash="8b7df143d91c716ecfa5fc1730022f6b421b05cedee8fd52b1fc65a96030ad52"; 
      
#for each line in the file 
      
for word in $(cat wordlist.txt); do 
      
    #hash the word 
      
    wordlistHash=$(echo -n $word | sha256sum | awk '{ print $1; }') 
      
    echo "Trying $word: $wordlistHash" 
      
    #if the hash is the same as the correct password's hash then we have cracked the password! 
      
    if [ $wordlistHash = $passwordHash ]; then 
      
        echo "Password has been cracked! It was $word" 
      
        exit 0 
      
    fi 
      
done 
      
exit 1 