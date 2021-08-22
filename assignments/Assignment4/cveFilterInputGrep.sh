#!/bin/bash
# ./cveFilterInputGrep.sh


tput setaf 5;
echo "Vendor List"
#Removes Duplicate Vendor Entries
tput setaf 7;
awk '!seen[$0]++' cveVendor.txt

#tput setaf 2;

#Sets users input search details
read -p "Enter Your Vendor Search : " inputfilter
tput setaf 5;
echo "You Selected: "$inputfilter
echo ""

                                        
                            # While inputfilter is not in cveVendor keep running...if it is...exit
                                                inputflag=0
                                                while [ $inputflag -eq 0 ]
                                                do
                                                
                                                            if grep -Fxq $inputfilter cveVendor.txt
                                                                then
                                                                 intputflag=1
                                                                 break
                                                             else

                                                             read -p "Incorrect Vendor - Please Enter correct Vendor :" inputfilter
                                                     
                                                             fi
                                                done


# Extra search criteria for the VENDOR selection using inputfitler

#grep /product/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveProduct.txt
#grep /vendor/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveVendor.txt
#grep /vulnerability-list/ cveOS.txt | grep $inputfilter | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveVulnerabilities.txt


exit 0