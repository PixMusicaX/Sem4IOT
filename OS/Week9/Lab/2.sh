if [ $# -lt 1 ]; then
  echo "Usage: $0 file1 file2 ..."
  exit 1
fi

for file in "$@"; do
  sed -i '/UNIX/d' "$file"
done
