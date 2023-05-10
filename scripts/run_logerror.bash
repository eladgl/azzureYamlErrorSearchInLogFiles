#!/bin/bash

dev_dirs=$(find . -type d -name "*dev*")

# Check if dev_dirs is empty
if [ -z "$dev_dirs" ]; then
    echo "ERROR: No directories containing 'dev' found"
    exit 1
fi

found_error=false

for dev_dir in $dev_dirs; do            #iterate all directories we found with dev
    if $found_error; then               #break from outloop if we found an ERROR in previoud iteration
        break
    fi
    abs_dev_dir=$(realpath "$dev_dir" 2>/dev/null)  #get its absolute path so when we use find
    cd "$abs_dev_dir" 2>/dev/null                 #we won't search log files in our workspace. 2>/dev/null, redirect any errors to perror stream
    log_files=$(find . -type f -name "*log")
    for log_file in $log_files; do
        count=$(grep "ERROR" "$log_file" | wc -l)
        if [ "$count" -gt 0 ]; then
            echo "FAIL found in $log_file"
            found_error=true            #if we find change this value to true
            break
        fi
    done
    cd ..                               #go back to work space and do it again
done

if ! $found_error; then                 #echo PASS if no log files with ERROR found
    echo "PASS"
fi