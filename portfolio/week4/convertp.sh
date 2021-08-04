read -sp "Type in your chosen password : " string 
echo "$string" | sed -r 's/w/3/g;s/l/1/g;s/s/5/g'

#new=$( printf "%s" "$t" | tr -cs 'a-zA-Z0-9' '-' )
#new=${new#-}; new=${new%-}

#echo $new	



exit 0