echo "Enter a number:"
read n

i=2
flag=0

while [ $i -le `expr $n / 2` ]
do
  if [ `expr $n % $i` -eq 0 ]
  then
    flag=1
    break
  fi

  i=`expr $i + 1`
done

if [ $flag -eq 1 ]
then
  echo "$n is not a prime number"
else
  echo "$n is a prime number"
fi