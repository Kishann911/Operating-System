#!/bin/bash

if [ ! -f input.txt ]; then
    echo "Error: input.txt file not found!"
    exit 1
fi

# Apply all transformations:
# y: Convert lowercase to uppercase
# s: Replace keywords (OPERATING SYSTEM -> OS)
# =: Print line numbers
# p: Preview output (implicit - sed outputs by default)
# a: Append marker at end of file

sed = input.txt | sed '
# Process pairs of lines (line number + content)
N
# Apply transformations to the second line (content) only
# First, save the line number (first line) to hold space
h
# Delete everything after newline (keep only line number)
s/\n.*//
# Exchange hold and pattern space (now pattern has content, hold has line number)
x
# Delete everything before newline (keep only content)
s/.*\n//
# y: Convert lowercase to uppercase
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/
# s: Replace keywords
s/OPERATING SYSTEM/OS/g
# Store transformed content in hold space
H
# Get both back (line number, then transformed content)
g
# Format as "number : content"
s/\n/ : /
# $ a: Append marker at the end of file
$ a\
----- END OF FILE -----
'
