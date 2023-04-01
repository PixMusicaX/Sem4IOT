cat > greet.sh << EOF
#!/bin/bash
echo "Welcome, \$USER!"
echo "Today is \$(date)"
EOF
chmod +x greet.sh
echo "$PWD/greet.sh" >> ~/.bash_profile
#You need to add this to bash startup file for it to work on startup ^ ^
