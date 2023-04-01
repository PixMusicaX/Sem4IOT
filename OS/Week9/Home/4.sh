if [ $# -ne 1 ]; then
  echo "Usage: $0 file"
  exit 1
fi

file=$1

tr -s ' ' '\n' < $file | sort | uniq -c | sort -nr
