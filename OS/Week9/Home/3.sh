
if [ $# -ne 1 ]; then
  echo "Usage: $0 file"
  exit 1
fi

file=$1

awk '
{
  for (i=1; i<=NF; i++) {
    len = length($i)
    count[len]++
  }
}
END {
  for (len in count) {
    print len, count[len]
  }
}
' $file
