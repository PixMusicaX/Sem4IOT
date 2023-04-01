password="admin"

chances=3

display_menu() {
  clear

  rows=$(tput lines)
  cols=$(tput cols)

  x=$(( ($rows - 8) / 2 ))
  y=$(( ($cols - 40) / 2 ))

  tput cup $x $y
  tput bold

  echo "Please select an option:"
  echo "1. Number of users currently logged in."
  echo "2. Calendar of current month."
  echo "3. Date in the format: dd/mm/yyyy."
  echo "4. Quit."

  tput sgr0
}

read_password() {
  read -sp "Enter the password: " input

  if [ "$input" == "$password" ]; then
    return 0
  else
    return 1
  fi
}

execute_option() {
  read -p "Enter your choice [1-4]: " choice

  clear

  case $choice in
    1) who;;
    2) cal;;
    3) date +%d/%m/%Y;;
    4) exit;;
    *) echo "Invalid option.";;
  esac

  read -n1 -r -p "Press any key to continue..."
}

while true; do
  if read_password; then
    break
  else
    ((chances--))

    if [ $chances -gt 0 ]; then
      echo -e "\nWrong password. You have $chances chance(s) left."
      sleep 2 
    else
      echo -e "\nWrong password. You have no chances left."
      exit 1 
    fi 
   fi 
done

while true; do 
   display_menu 

   execute_option 
done 
