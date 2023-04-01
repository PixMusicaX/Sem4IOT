gcd() {
  num1=$1
  num2=$2
  while [ $num2 -ne 0 ]
  do
    temp=$num2
    num2=$(expr $num1 % $num2)
    num1=$temp
  done
  echo $num1
}

co_prime() {
  num1=$1
  num2=$2
  cd=$(gcd $num1 $num2)
  if [ $cd -eq 1 ]
  then
    echo "The numbers $num1 and $num2 are prime to each other."
  else
    echo "The numbers $num1 and $num2 are not prime to each other."
  fi
}

echo "Enter the first number: "
read num1
echo "Enter the second number: "
read num2

co_prime $num1 $num2
