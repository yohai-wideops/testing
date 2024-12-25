#!/bin/bash

# Concatenate all input arguments into a single string
commit_message="$*"

# Define patterns (case-insensitive matching)
minor_pattern="^(?i)feature[a-zA-Z0-9]*"
patch_pattern1="^(?i)bugfix[a-zA-Z0-9]*"
patch_pattern2="^(?i)hotfix[a-zA-Z0-9]*"
major_pattern="(?i)[Bb][Rr][Ee][Aa][Kk][Ii][Nn][Gg] [Cc][Hh][Aa][Nn][Gg][Ee]"

# Check the commit message against the patterns
if [[ $commit_message =~ $minor_pattern ]]; then
    echo "minor"
elif [[ $commit_message =~ $patch_pattern1 ]] || [[ $commit_message =~ $patch_pattern2 ]]; then
    echo "patch"
elif [[ $commit_message =~ $major_pattern ]]; then
    echo "major"
else
    echo "Error: No matching pattern" >&2
    exit 1
fi
