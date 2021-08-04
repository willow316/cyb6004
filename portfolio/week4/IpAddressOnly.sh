
       #!/bin/bash 
      
./IpInfo.sh > ipdetail.txt
#Ipdetails=./IpInfo.sh


#addresses= cat ipdetail.txt

#echo "$addresses"

addresses2=$(cat "ipdetail.txt" | sed -n '/IP Address/ {
       s/IP Address/\nIp Address/
p       
       }')

echo "The IP Addresses of this computer are: $addresses2"


exit 0
