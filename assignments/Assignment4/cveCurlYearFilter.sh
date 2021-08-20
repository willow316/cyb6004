#/!/bin/bash
#./cveCurlYearFilter

url=https://www.cvedetails.com/top-50-products.php?year=

read -p "Enter Year to Search between 1999 - 2021 : " inputyear

#While loop will force the user to select a year between 2021 and 1999 to enforce the condition, otherwise the website will print the "ALL YEARS" output

while [ "$inputyear" -gt 2021  -o "$inputyear" -lt 1999 ]
    do
    echo "Input must be between 1999 and 2021"
    read -p "Enter a year between 1999 - 2021 :" inputyear
    
    done


yearcurl=$url$inputyear

echo ""
echo "Scraping :  " $yearcurl

curl -ks $yearcurl > cveOS.txt

       exit 0

