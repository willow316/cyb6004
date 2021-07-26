#! /bin/bash

# -eq
#-ne
#-gt
#-ge  greater than or eq to
#-lt less than if [ $a -lt $b]
# -le  less or eq



read -p "Enter UV index: " uval

if  [[ $uval -ge 0 ]] && [[ $uval -le 2 ]]; then
    echo "0-2 LOW"
elif [[ $uval -ge 3 ]] && [[ $uval -le 7 ]]; then
    echo "3-7 MED"
elif [[ $uval -ge 8 ]] && [[ $uval -le 11 ]]; then
    echo "8-11 HIGH"
else
    echo "incorrect entry"
fi

exit 0