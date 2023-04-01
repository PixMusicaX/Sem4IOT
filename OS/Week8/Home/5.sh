if [ $# -ne 2 ]; then
  echo "Usage: $0 dir1 dir2"
  exit 1
fi
dir1=$1
dir2=$2
if [ -d $dir1 ] && [ -d $dir2 ]; then
  for file in `ls $dir1`; do
    if [ -f $dir2/$file ]; then
      rm $dir2/$file
      echo "Deleted $dir2/$file"
    fi
  done
else
  echo "One or both of the directories are not valid"
fi
