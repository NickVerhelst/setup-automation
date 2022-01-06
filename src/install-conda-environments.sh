#! bin/bash

file_pattern='ls environments/*.yml'

for entry in $file_pattern
do
    echo "Installing environment $entry"
    conda env create --file $entry
done
