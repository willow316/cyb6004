#! /bin/bash

A=10
B=20
let C=$A+$B

echo $A
echo $B
echo $C
echo ""
echo "The sum of A+B = " $C

((E=5))
echo $E

(( F = E + 3 ))
echo $F

((F++))
echo "++ F:"$F 

read -p "value of G " G
echo $G
((H=F+G))
echo $H


exit 0