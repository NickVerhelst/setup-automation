#!/bin/bash
parent_path=$(pwd)
relative_path="testfiles/test-linux-packages.txt"
full_path="$parent_path/$relative_path"
# Convert input text file to Unix format (needed for correct line endings)
dos2unix $full_path
# Create temp fil"
# ? TODO: Find out how this can be done WITHOUT the intermediate file.
(sed -E '/^[[:blank:]]*(#|$)/d; s/#.*//' $full_path > .parsed_input_bash.txt)
# Convert file to remove all comments
while read line; do
    echo "Installing $line"
    sudo apt-get install $line | xargs
done < .parsed_input_bash.txt
# When done, cleanup the temp file.
rm .parsed_input_bash.txt
