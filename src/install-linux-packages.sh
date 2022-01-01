#!/bin/bash
parent_path=$(pwd)
relative_path="testfiles/test-linux-packages.txt"
full_path="$parent_path/$relative_path"
# Convert input text file to Unix format (needed for correct line endings)
dos2unix $full_path
# Convert file to remove all comments
# $file_without_comments="$("${full_path}" | grep -v '^#' | grep -v '^\s*$' | cut -d ' ' -f1)"
while IFS= read -r line; do
    $line | cut -d '#' -f1 > echo
    # echo '%s\n' "Installing $parsed_line"
    # sudo apt-get install $line | xargs
done < $full_path

# sudo apt-get install <package>