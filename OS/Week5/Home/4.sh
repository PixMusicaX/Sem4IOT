echo "Enter a number:"
read num

sum=0
while [ $num -gt 0 ]
do
  digit=`expr $num % 10`
  sum=`expr $sum + $digit`
  num=`expr $num / 10`
done

echo "The sum of digits is: $sum"
