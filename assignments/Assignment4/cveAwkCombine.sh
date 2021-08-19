

#!/bin/bash

# This command will create an array which enables input from the three webscrape commands (pulling Product, Vendor and Vulnerability
# to be pulled into one delimited txt file for use with AWK to display on screen automatically


awk 'FILENAME==ARGV[1] {a[FNR]=$0} FILENAME==ARGV[2] {b[FNR]=$0} FILENAME==ARGV[3] {print ""a[FNR]":",b[FNR]":",$0":"}' cveProduct.txt cveVendor.txt cveVulnerabilities.txt > cveAwkFile.txt

exit 0

