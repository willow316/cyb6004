


#!/bin/bash 
 

 grep -r "sed"
 grep -r "^m"

 # 3 words practice and attempts 
 #grep -r [0-9][0-9][0-9]
 #grep -r -w [^a-z][' '][^a-z][' '][^a-z]
 #grep -r '[*][][*][][*]'
 #   grep -r \w\s\w\s\w
 #  grep -r 'echo .*\"[A-Z].*\"'

 #various ways to work on 3 words
  #grep -inoE '(\w+\W+){3,}' words.txt
  #grep -inoE '(\w+\w+\w+)\s(\w+\w+\w+)' words.txt
#grep -inoE '(\w+\W+){3,}' words.txt
#grep -inoE '(\w+\w+\w+)\s(\w+\w+\w+)\s(\w+\w+\w+)' words.txt

grep -inoE '(\w+\W+){3,}' words.txt



#password checker
 #grep -E "[a-zA-Z0-9]+ +[a-zA-Z0-9]+ +[a-zA-Z0-9]" words.txt | grep -E "[a-zA-Z0-9]{8,}" | grep -v "[^a-z]"
 grep -E "[a-zA-Z0-9]+ +[a-zA-Z0-9]+ +[a-zA-Z0-9]" words.txt | grep -E "[a-zA-Z0-9]{8,}" | grep -E "[!@#$%^&*()]"





exit 0