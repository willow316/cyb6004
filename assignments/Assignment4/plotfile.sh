
#!/bin/bash

# This command will create an array which enables input from the three webscrape commands to be pulled into one delimited txt file for use with AWK to display on screen automatically
awk 'FILENAME==ARGV[1] {a[FNR]=$0} FILENAME==ARGV[2] {print a[FNR],FS,$0} ' output.txt output3.txt > plotfile.txt

exit 0
