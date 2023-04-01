if [ $# -ne 1 ]; then
  echo "Usage: $0 logname"
  exit 1
fi

logname=$1

read -s -p "Password:" USER_PASSWORD

info=$(getent passwd "$logname")

echo "$info" | awk -F: '{print "Username: "$1"\nPassword: "$2"\nUser ID: "$3"\nGroup ID: "$4"\nComment: "$5"\nHome Directory: "$6"\nShell: "$7}'
