
#!/bin/bash 
      
#If there aren't two arguments to the script 

#read a
#read b
#if (( $#!=5 )); then 
      
    #Print an error and exit 
      
 #   echo "Error, provide 5 fruits" && exit 1 
      
#fi 
      
#For every number between the first argument and the last 
      
for ((i = $1; i <= $5; i++)) 
      
do 
      
    #Create a new folder for that number 
    #if [ $fruit == 'APPLE' | 'apple' | 'Apple' ] ;
        #then 
        #tput setaf 2;  
        #echo "Fruit : $i"
            #else
            echo "Fruit : $i"
  
    #fi
done 
     
exit 0