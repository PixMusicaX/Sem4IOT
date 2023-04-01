if [ $# -ne 1 ]; then
  echo "Usage: $0 filename"
  exit 1
fi
filename=$1
if [ -f $filename ]; then
  echo "$filename is a regular file"
  words=`wc -w $filename | cut -d ' ' -f 1`
  chars=`wc -c $filename | cut -d ' ' -f 1`
  lines=`wc -l $filename | cut -d ' ' -f 1`
  echo "Total number of words: $words"
  echo "Total number of characters: $chars"
  echo "Total number of lines: $lines"
else
  echo "$filename is not a regular file"
fi
