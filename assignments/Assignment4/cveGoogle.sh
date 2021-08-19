#/!/bin/bash

curl -ks https://www.cvedetails.com/top-50-products.php > cveOS.txt

grep Google cveOS.txt > cveGoogle.txt

grep /product/ cveGoogle.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveGoogleProduct.txt
grep /vendor/ cveGoogle.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveGoogleVendor.txt
grep /vulnerability-list/ cveGoogle.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveGoogleVulnerabilities.txt

#cat cveGoogleVulnerabilities.txt

awk 'FILENAME==ARGV[1] {a[FNR]=$0} FILENAME==ARGV[2] {b[FNR]=$0} FILENAME==ARGV[3] {print ""a[FNR]":",b[FNR]":",$0":"}' cveGoogleProduct.txt cveGoogleVendor.txt cveGoogleVulnerabilities.txt > cveGoogleAwkFile.txt

tput setaf 6;
echo ""
echo "Google Breakdown"
echo ""
tput setaf 3;
awk '{sum += $1 } END { print "Total Vulnerabilities : \033[31m" sum }' cveGoogleVulnerabilities.txt
#cat cveGoogleVulnerabilities.txt | perl -ne '$sum += $_ } { print $sum'

tput setaf 7;
#read -p "Please enter your filter :" filter

#Prints the output of the plotfile.sh/plotfile.txt file into the screenoutput using the arguments delimiated by :

awk 'BEGIN {
      
    FS=":"; 
      
    print "_____________________________________________________________________________________________"; 
      
   

    printf("| \033[32m%-30s\033[0m | \033[32m%-20s\033[0m | \033[32m%-20s\033[0m |\n|-----------------------------------|--------------------------|----------------------------|\n", 
    "     Product                     ", "   Vendor               ", "   Vulnerabilities        ");
}

{

printf("| \033[35m%-30s\033[0m    |   \033[33m%-20s\033[0m   | \033[35m%-20s\033[0m       |\n", $1, $2, $3);

}

END {

    print("|-------------------------------------------------------------------------------------------|");

}' cveGoogleAwkFile.txt


echo "|                                                                                           |"



exit 0