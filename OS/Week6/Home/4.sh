user_list=$(who | cut -d' ' -f1 | sort | uniq)
num_users=$(echo "$user_list" | wc -w)
echo "List of users connected to the system:"
echo "$user_list"
echo ""
echo "Number of users connected to the system: $num_users"
