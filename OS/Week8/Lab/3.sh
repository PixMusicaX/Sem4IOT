for file in `ls`; do
  first=`echo $file | cut -c1`
  case $first in
    [aAeEiIoOuU]*)
      echo $file
      ;;
  esac
done
