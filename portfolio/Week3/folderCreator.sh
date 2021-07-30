
       #!/bin/bash 

folderglobal=$(pwd)
#export folderglobal
echo "Current Folder Location and existing files : " $folderglobal
echo $(ls -d */ > filelist.txt)
cat filelist.txt
rm filelist.txt
echo ""
tput setaf 2;
read -p "type the name of the folder you would like to create : " folderName       
mkdir "$folderName" 

exit 0
     