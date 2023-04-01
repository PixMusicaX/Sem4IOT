if [ $# -ne 3 ]
then
  echo "Usage: $0 num1 num2 num3"
  exit 1
fi

# Find the maximum of the three numbers
if [ $1 -gt $2 ] && [ $1 -gt $3 ]
then
  echo "$1 is the maximum number"
elif [ $2 -gt $1 ] && [ $2 -gt $3 ]
then
  echo "$2 is the maximum number"
else
  echo "$3 is the maximum number"
fi
