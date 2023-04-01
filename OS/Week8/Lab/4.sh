if [ $# -ne 2 ]; then
  echo "Usage: $0 file1 file2"
  exit 1
fi
file1=$1
file2=$2
if [ ! -f $file1 ]; then
  echo "$file1 is not a regular file"
  exit 2
fi
if [ ! -f $file2 ]; then
  echo "$file2 is not a regular file"
  exit 3
fi
checksum1=`md5sum $file1 | cut -d ' ' -f 1`
checksum2=`md5sum $file2 | cut -d ' ' -f 1`
if [ $checksum1 = $checksum2 ]; then
  echo "$file1 and $file2 have the same content"
  echo "Deleting $file2"
  rm $file2
else
  echo "$file1 and $file2 have different content"
fi
