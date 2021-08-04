echo "$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c16)" 

exit 0