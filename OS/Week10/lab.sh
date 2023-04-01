show_menu() {
  echo "1. List of users currently logged in"
  echo "2. Present date"
  echo "3. Present working directory"
  echo "4. Quit"
}

read_choice() {
  echo -n "Enter your choice [1-4]: "
  read option
}

while true; do
  show_menu
  read_choice
  case $option in
    1) who;;
    2) date;;
    3) pwd;;
    4) exit;;
    *) echo "Invalid option";;
  esac
done
