echo "Enter an integer:"
read n

fact=1
i=1

while [ $i -le $n ]
do
  fact=`expr $fact \* $i`
  i=`expr $i + 1`
done

echo "The factorial of $n is $fact"
