read -p "Enter a string: " str
len=${#str}
if [ $len -lt 10 ]; then
  echo "The string is too short. It has only $len characters."
else
  echo "The string is long enough. It has $len characters."
fi
