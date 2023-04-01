if [ "$1" == "lm" ]; then
    # list files by modification time
    find . -type f -printf "%T+\t%p\n" | sort
# check if argument is la
elif [ "$1" == "la" ]; then
    # list files by access time
    find . -type f -printf "%A+\t%p\n" | sort
else
    # list all files in current directory
    ls -l
fi
