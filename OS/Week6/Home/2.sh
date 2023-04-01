read -p "Enter a string: " str
rev_str=$(echo $str | rev)
if [ "$str" == "$rev_str" ]; then
    echo "The string is a palindrome."
else
    echo "The string is not a palindrome."
fi
