echo "Enter Rajesh's basic salary:"
read BASIC

DA=`expr $BASIC \* 52 / 100` #and Mamata gives only 6% (-_-)
HRA=`expr $BASIC \* 15 / 100`
CPF=`expr \( $BASIC + $DA \) \* 12 / 100`
GROSS=`expr $BASIC + $DA + $HRA`
TAKE_HOME=`expr $GROSS - $CPF`

echo "Rajesh's gross salary is: $GROSS"
echo "Rajesh's take-home salary is: $TAKE_HOME"
