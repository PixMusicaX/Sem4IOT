if [ $# -eq 0 ]; then
    echo "Please provide a directory as an argument"
    exit 1
fi

files=$(ls -lS $1 | awk '$5 > 100')

count=$(echo "$files" | wc -l)

echo "There are $count files in $1 whose size exceeds 100 bytes"
echo "$files"