#!/bin/bash 
#set -x

i=0
for ((i = 1; i = 2; i++)) 
      
do 
      
    #Create a new folder for that number 


            read -p "Please type the URL of the file you wish to download or type 'exit' to quit :" filetodown
                
            if [ $filetodown == 'exit' ] ; then
            #let i=$i+1
            break
            else
                        echo ""
                        #echo $filetodown
                        echo ""
                        read -p "Please the location to save the file :" filelocation
                        read -p "What would you like to call the file :" filename
                        echo ""
                        #wget -p $filetodown 
                        #let i=$i-1
                        echo "This would run the command"
                        wget -O /pics/$filename https://e0.365dm.com/21/06/1600x900/skysports-everton-fixtures_5415954.jpg?20210615152642

                        #mv $filename $filelocation     
            fi
      
done 
     
exit 0