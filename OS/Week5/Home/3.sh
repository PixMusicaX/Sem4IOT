echo "Enter the lower limit of the range:"
read lower

echo "Enter the upper limit of the range:"
read upper

echo "Prime numbers between $lower and $upper are:"

n=$lower

while [ $n -le $upper ]
do
  if [ $n -eq 2 ]
  then
    echo $n
  fi

  if [ `expr $n % 2` -ne 0 -a $n -gt 2 ]
  then
    i=3
    flag=0

    while [ `expr $i \* $i` -le $n ]
    do
      if [ `expr $n % $i` -eq 0 ]
      then
        flag=1
        break
      fi

      i=`expr $i + 2`
    done

    if [ $flag -eq 0 ]
    then
      echo $n
    fi
  fi

  n=`expr $n + 1`
done
