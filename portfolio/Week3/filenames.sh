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
		if grep -q '.sh' $LINE; then
		echo "This is a bash file"
		else
		counter=1
		
			elif grep -q '.txt' $LINE; then
			echo "This is a text file"
			else
			counter=1
			 
					elif grep -q '' $LINE; then
					echo "empty line"
					else
					counter=1
					 

						elif grep -q '/' $LINE; then
						echo "This is a directory"
						else
						counter=1
						 
	fi
	#fi
	#fi
	#fi
						
						if counter=1 ; then
	counter=2
	else
	"Nothing Found"
	fi

	done
	

exit 0 