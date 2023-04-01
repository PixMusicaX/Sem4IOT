echo "Welcome, $USER!"
echo "Today is $(date)"
h=$(date +"%H")
if [ $h -gt 6 -a $h -le 12 ]; then
  echo "GOOD MORNING"
elif [ $h -gt 12 -a $h -le 18 ]; then
  echo "GOOD AFTERNOON"
else
  echo "GOOD EVENING"
fi
#You need to add this to bash startup file for it to work on startup ^ ^
