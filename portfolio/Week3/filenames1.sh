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
		echo "text file output :"$LINE
		
		if [ -z "$LINE" ] ; then
			echo "before grep check LINE is null"
					elif grep -q '.sh' $LINE; then
					echo "This is a bash file"
			
						elif grep -q '.txt' $LINE; then
						echo "This is a text file"
		
								elif grep -q '' $LINE; then
								echo "empty line"
		
									elif grep -q '/' $LINE; then
									echo "This is a directory"
			
					
					#echo "No lines found"
					#echo "text file output :"$LINE
					#fi
		else
		echo "Null exit :" $LINE
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