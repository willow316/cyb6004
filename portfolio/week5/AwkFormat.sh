#!/bin/bash


       #!/bin/bash 
      
echo "Google Server IPs:" 
      
awk 'BEGIN { 
      
    FS=":"; 
      
    print "__________________________________________________________"; 
      
    print "| \033[34mServer Type\033[0m | \033[34mIP\033[0m                  | \033[34mComments\033[0m            |"; 
      
} 
      
{ 
      
    printf("| \033[33m%-11s\033[0m | \033[35m%-14s\033[0m | \033[38m%-14s\033[0m |\n", $1, $2, $3); 
      
} 
      
END { 
      
    print("__________________________________________________________"); 
      
}' input.txt 
     
     

exit 0
