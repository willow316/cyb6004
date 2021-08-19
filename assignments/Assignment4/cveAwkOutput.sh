tput setaf 7;
echo "Vulnerabilities"
echo "-----------------------------------------------------------------------"

tput setaf 3;
awk '{sum += $1 } END { print "Total Vulnerabilities : \033[31m" sum }' cveVulnerabilities.txt
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

    print("_____________________________________________________________________________________________");

}' cveAwkFile.txt

exit 0
