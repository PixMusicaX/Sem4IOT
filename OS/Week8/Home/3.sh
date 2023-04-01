if [ $# -ne 1 ]; then
  echo "Usage: $0 filename"
  exit 1
fi
filename=$1
if [ -f $filename ]; then
  size=`wc -c $filename | cut -d ' ' -f 1`
  if [ $size -eq 0 ]; then
    echo "$filename is a blank file"
  else
    echo "$filename is not a blank file"
    echo "The contents of the file are:"
    cat $filename
  fi
else
  echo "$filename is not a valid file"
fi
