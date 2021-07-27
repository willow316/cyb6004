#!/bin/bash

for fruit in "$@"
 
 do
    lowerfruit=$fruit
    declare -u lowerfruit
    #echo "lowerfruit : "$lowerfruit
    if [ $lowerfruit == 'APPLE' ] ;
        then 
        tput setaf 2;  
        echo "Fruit : $lowerfruit"
        else
        exit1=$lowerfruit
    fi
            
    if [ $lowerfruit == 'ORANGE' ] ;
         then 
         tput setaf 1;  
         echo "Fruit : $lowerfruit"
         else
         exit2=$lowerfruit
     fi
     if [ $lowerfruit == 'MANGO' ] ;
         then 
         tput setaf 6;  
         echo "Fruit : $lowerfruit"
         else
         exit3=$lowerfruit
    fi
         if [ $lowerfruit == 'BANANA' ] ;
         then 
         tput setaf 5;  
         echo "Fruit : $lowerfruit"
         else
         exit4=$lowerfruit
    fi
         if [ $lowerfruit == 'STRAWBERRY' ] ;
         then 
         tput setaf 3;  
         echo "Fruit : $lowerfruit"
         else
         exit5=$lowerfruit
    fi
     #else       
     #tput setaf 7;
     #echo "Fruit : $fruit"
     #echo ""
     #fi
done

exit 0
