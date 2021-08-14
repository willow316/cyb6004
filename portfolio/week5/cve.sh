#/!/bin/bash

productlist=$(<"cveos.txt")

nextlist=$(cat "cveos.txt" | sed -n 's/.*\(product\)/\1/p' | sed -n 's/\(td\).*/\1/p' | sed -n 's/.*\(title="(\w+\s)*(\w+)">)/\1/p'

# echo "title="Product Details Debian Debian Linux">Debian Linux" | sed -E 's/title=\w+\s\w+\s{1,}//'




 #      sed -n '/product/'
  #  s/product/REPLACECHECK/
#p       
 #      }
  #     
   #    '
    #   
       )

       #

echo $nextlist


exit 0




