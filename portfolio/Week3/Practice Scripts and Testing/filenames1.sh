#!/bin/bash 
#set -x
#for filein in "$@"
filein="$@"
echo "filein: "$filein
#do
#	new=1
	#echo $filein
#done

#FILENAME="filenames.txt"
LINES=$(cat $filein)

for LINE in $LINES; 

	do
		#echo "text file output :"$LINE
		
		if [ -z "$LINE" ] ; then
			#echo "before grep check LINE is null"
			counter=1
					#elif grep -q '.sh' $LINE; then
					elif (echo $LINE | grep -q '.sh') ; then
					echo $LINE " : This is a bash file"
			
						#elif grep -q '.txt' $LINE; then
						elif (echo $LINE | grep -q '.txt') ; then
						echo $LINE " : This is a text file"
		
								#elif grep -q '' $LINE; then
								elif (echo $LINE | grep -q '') ; then
								#echo $LINE " : empty line"
									counter=1
									#elif grep -q '/' $LINE; then
									elif (echo $LINE | grep -q '../') ; then
									echo $LINE " : This is a directory"
			
					
					#echo "No lines found"
					#echo "text file output :"$LINE
					#fi
		else
		echo "I dont know what this is :" $LINE
		counter=1
		fi
	#fi
	#fi
	#fi
						
						#if counter=1 ; then
	#counter=2
	#else
	#"Nothing Found"
	#fi

done
	

exit 0 