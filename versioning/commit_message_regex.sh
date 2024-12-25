#!/bin/bash

# Concatenate all input arguments into a single string
commit_message="$*"

# Convert commit message to lowercase for case-insensitive matching
commit_message_lower=$(echo "$commit_message" | tr '[:upper:]' '[:lower:]')

# Define patterns (now case-sensitive since input is lowercase)
minor_pattern="^feature.*"
patch_pattern1="^bugfix.*"
patch_pattern2="^hotfix.*"
major_pattern="breaking change"

# Check the commit message against the patterns
if [[ $commit_message_lower =~ $minor_pattern ]]; then
    echo "minor"
elif [[ $commit_message_lower =~ $patch_pattern1 ]] || [[ $commit_message_lower =~ $patch_pattern2 ]]; then
    echo "patch"
elif [[ $commit_message_lower =~ $major_pattern ]]; then
    echo "major"
else
    echo "Error: No matching pattern" >&2
    exit 1
fi
