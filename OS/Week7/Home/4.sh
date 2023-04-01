if [ $# -eq 0 ]; then
  echo "Usage: $0 LOGNAME or UID"
  exit 1
fi
arg=$1
if [ $arg -eq $arg ] 2>/dev/null; then
  user=$(getent passwd $arg | cut -d: -f1)
else
  user=$arg
fi
terminals=$(who -u | grep "^$user " | wc -l)
echo "User $user has logged in $terminals terminal(s)"
