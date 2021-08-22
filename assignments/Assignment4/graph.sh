#!/bin/bash

grep /vendor/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveVendor.txt
grep /vulnerability-list/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveVulnerabilities.txt

awk 'FILENAME==ARGV[1] {a[FNR]=$0} FILENAME==ARGV[2] {print a[FNR],":"$0}' cveProduct.txt cveVulnerabilities.txt > cveGraph1.txt

sed 's/ //g' cveGraph1.txt > cveGraph2.txt

cat -n cveGraph2.txt > cveGraph3.txt

sed 's/:/ /g' cveGraph3.txt > cveGraph4.txt

#read -p "Please select the number of rows to output up to 50 :" linevar
#delete everything after line $LINEVAR due to the limitations of GNUPLOT for later lables
sed -i '10,$d' cveGraph4.txt
#sed -i '$linevar,$d' cveGraph4.txt
#lines=$(head -n $linevar cveGraph4.txt)

rm cveVendor.txt
rm cveVulnerabilities.txt
rm cveGraph1.txt
rm cveGraph2.txt
rm cveGraph3.txt
#rm cveGraph4.txt




exit 0
