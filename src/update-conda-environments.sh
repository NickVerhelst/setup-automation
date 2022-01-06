#! bin/bash

file_pattern='ls environments/*.yml'

for entry in $file_pattern
do
    echo "Updating environment $entry"
    conda env update --prefix ./env --file $entry --prune # If you want to update an environment using a new YAML file.
done
