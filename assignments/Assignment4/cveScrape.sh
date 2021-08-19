#/!/bin/bash

# Script will use some known formats and regex to extract the Product, Vendor and Vulnerability Numbers from the TOP 50 URL thrown from CVE.sh Curl command


grep /product/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveProduct.txt
grep /vendor/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' > cveVendor.txt
grep /vulnerability-list/ cveos.txt | sed 's/.* title=.*">//g' | sed 's/<\/.*//g' | sed 's/Cisco 479//g' | sed 's/.*All Time Leaders//g' >cveVulnerabilities.txt



exit 0




