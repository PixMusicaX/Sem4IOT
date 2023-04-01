if [ $# -ne 1 ]; then
  echo "Usage: $0 filename"
  exit 1
fi

filename=$1

info=$(ls -l "$filename")

echo "$info" | awk -F" " '{print "File type: "$1"\nFile permissions: "$2"\nNumber of hard links: "$3"\nOwner name: "$4"\nGroup name: "$5"\nFile size: "$6"\nLast modified date and time: "$7" "$8" "$9"\nFile name: "$10}'
