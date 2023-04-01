if [ $# -lt 2 ]; then
  echo "Usage: $0 list file1 file2 ..."
  exit 1
fi

list=$1

while read word; do
  total=0

  for file in "${@:2}"; do
    count=$(grep -o -w "$word" "$file" | wc -l)
    total=$((total + count))
  done

  echo "$word: $total"
done < "$list"
