#!/bin/bash

echo "Enter the directory name:"
read dirname

if [ -d "$dirname" ]; then
    current_files=$(ls | wc -l)
    specified_files=$(ls "$dirname" | wc -l)

    if [ "$current_files" -gt "$specified_files" ]; then
        echo "The current directory has more files than $dirname by $(($current_files - $specified_files)) files."
    elif [ "$current_files" -lt "$specified_files" ]; then
        echo "$dirname has more files than the current directory by $(($specified_files - $current_files)) files."
    else
        echo "Both directories have the same number of files."
    fi
else
    echo "$dirname is not a valid directory."
fi
