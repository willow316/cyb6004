
       #!/bin/bash 
      
secret='shhh' #Don't tell anyone! 
      
#if the user types in the correct secret, tell them they got it right! 
      echo $REPLY
if [ "$secret" = shhh ]; then 
      
    echo "You got it right!" 
      
    correct=true 
      
else     
	echo "You got it wrong :(" 
      
    correct=false 
      
fi 
      echo $correct
read -s -p "what's the secret code?" 
      
echo 
      
case $correct in 
      
false) 
      
    echo "Go Away!" #people who get it wrong need to be told to go away! 
      
    ;; 
      
true) 
      
    echo "you have unlocked the secret menu!" 
      
    #TODO: add a secret menu for people in the know. 
      
    ;; 
      
esac 
     