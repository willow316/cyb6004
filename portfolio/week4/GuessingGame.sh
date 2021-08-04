
       #!/bin/bash 
      
 
      
#This function prints a given error 
      
printError() 
      
{ 
      
    echo -e "\033[31mERROR:\033[0m $1" 
      
} 
      
 
      
#This function will get a value between the 2nd and 3rd arguments 
      
getNumber() 
      
{ 
      
    read -p "$1: " 
    #echo "dollar 1 echo : "$REPLY
    
      
    while (( $REPLY < $2 || $REPLY> $3 )); do 

        printError "Input must be between $2 and $3"     
                    
        read -p "$1: "
              
    done 

    
    
} 
      

      
   
 
      
#echo "this is the start of the script" 
      
getNumber "please type a number between 1 and 100" 1 100
 

    
 while (( $REPLY != 42)); do
    echo "reply is $REPLY"
        
                        if [ $REPLY -lt 42 ]
                        then
                        echo "$REPLY Too Low"
                      
                                 elif [ $REPLY -gt 42 ]
                                 then
                                 echo "$REPLY Too High"
                             
                        else
                        counter=0
                        fi          
                           getNumber "please type a number between 1 and 100" 1 100                       
        
       
        
     done 

        
     
        tput setaf 2;  
        echo "Congratulations 42 is the correct number"
            exit 0
                
#getNumber "please type a number between 50 and 100" 50 100 
      
#echo "Thank you!" 


     