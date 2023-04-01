add() {
  result=$(expr $1 + $2)
  echo "Result: $result"
}

subtract() {
  result=$(expr $1 - $2)
  echo "Result: $result"
}

multiply() {
  result=$(expr $1 \* $2)
  echo "Result: $result"
}

divide() {
  result=$(expr $1 / $2)
  echo "Result: $result"
}

echo "Enter the operation you want to perform (+, -, *, /):"
read op
echo "Enter the first number:"
read num1
echo "Enter the second number:"
read num2

case $op in
  "+")
    add $num1 $num2
    ;;
  "-")
    subtract $num1 $num2
    ;;
  "*")
    multiply $num1 $num2
    ;;
  "/")
    divide $num1 $num2
    ;;
  *)
    echo "Invalid operation. Please try again."
    ;;
esac
