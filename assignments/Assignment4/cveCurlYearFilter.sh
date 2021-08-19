#/!/bin/bash
#./cveCurlYearFilter

url=https://www.cvedetails.com/top-50-products.php?year=

read -p "Enter Year to Search between 1999 - 2021 : " inputyear

yearcurl=$url$inputyear

echo ""
echo "Scraping :  " $yearcurl

curl -ks $yearcurl > cveOS.txt

       exit 0

