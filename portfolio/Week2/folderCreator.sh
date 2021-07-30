
       #!/bin/bash 

folderglobal=$(pwd)
echo $folderglobal
export folderglobal
echo "Current Folder Location and existing files : "
echo $(ls -d */ > filelist.txt)
cat filelist.txt
rm filelist.txt
echo ""
read -p "type the name of the folder you would like to create : " folderName       
mkdir "$folderName" 

exit 0
     