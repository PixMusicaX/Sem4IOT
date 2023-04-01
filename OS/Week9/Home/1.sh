if [ $# -ne 1 ]; then
  echo "Usage: $0 list_of_names"
  exit 1
fi

list_of_names=$1

for name in $list_of_names; do
  info=$(getent passwd "$name")
  echo "$info"
done
