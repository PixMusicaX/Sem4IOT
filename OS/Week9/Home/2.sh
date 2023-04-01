if [ $# -ne 1 ]; then
  echo "Usage: $0 minutes"
  exit 1
fi

minutes=$1

seconds=$((minutes * 60))

while true; do
  who --count | grep users
  sleep $seconds
done
