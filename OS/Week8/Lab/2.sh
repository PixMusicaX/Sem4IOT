sum=0
for file in `ls -p | grep -v /`; do
  echo $file
  size=`stat -c %s $file`
  sum=`expr $sum + $size`
done
echo "The total size is $sum bytes"
