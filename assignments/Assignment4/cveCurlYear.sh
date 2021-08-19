#/!/bin/bash
#./cveCurlYear

url=https://www.cvedetails.com/top-50-products.php?year=

echo $url

read -p "Enter Year to Search between 1999 - 2021 : " inputyear

yearcurl=$url$inputyear

curl -ks $yearcurl > cveOS.txt


       exit 0

