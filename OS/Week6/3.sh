is_div() {
  num=$1
  sum=0
  while [ $num -ne 0 ]
  do
    digit=$(expr $num % 10)
    if [ $(expr $sum % 2) -eq 0 ]
    then
      sum=$(expr $sum + $digit)
    else
      sum=$(expr $sum - $digit)
    fi
    num=$(expr $num / 10)
  done
  if [ $sum -eq 0 ]
  then
    echo "The number is divisible by 11."
  else
    echo "The number is not divisible by 11."
  fi
}

echo "Enter a number: "
read num

is_div $num
