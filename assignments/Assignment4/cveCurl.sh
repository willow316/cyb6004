#/!/bin/bash

curl -ksi https://www.cvedetails.com/top-50-products.php > cveOS.txt

#sizecheck=$(

#curl -k -s -I https://www.cvedetails.com/top-50-products.php | grep -i content-length | awk '{print $2}'
#curl -sI http://download.thinkbroadband.com/1GB.zip | grep -i content-length | awk '{print $2}'

#echo $sizecheck

#curl -ksi https://www.cvedetails.com/top-50-products.php | output=grep Content-Length 

#echo $output

#URL="http://api.twitter.com/1/statuses/public_timeline.json"
#curl -sI $URL | grep -i Content-Length | awk '{print $2}'

#curl 'http://api.twitter.com/1/statuses/public_timeline.json' 

       exit 0

