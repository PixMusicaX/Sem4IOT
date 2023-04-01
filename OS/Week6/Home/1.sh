read -p "Enter number of lines: " n
for ((i=1; i<=n; i++))
do
    for ((j=1; j<=n-i; j++))
    do
        echo -n "  "
    done
    for ((j=1; j<=2*i-1; j++))
    do
        echo -n "* "
    done
    echo ""
done