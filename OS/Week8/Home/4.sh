if [ $# -ne 2 ]; then
  echo "Usage: $0 file1 file2"
  exit 1
fi
file1=$1
file2=$2
if [ -f $file1 ] && [ -f $file2 ]; then
  cat $file1 $file2 > result.txt
  echo "The concatenated file is result.txt"
  chars=`wc -c result.txt | cut -d ' ' -f 1`
  words=`wc -w result.txt | cut -d ' ' -f 1`
  lines=`wc -l result.txt | cut -d ' ' -f 1`
  echo "The number of characters in result.txt is $chars"
  echo "The number of words in result.txt is $words"
  echo "The number of lines in result.txt is $lines"
else
  echo "One or both of the files are not valid"
fi
