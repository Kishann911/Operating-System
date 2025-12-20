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
# Read the next line so we have both the line number and the text together
N

# Save a copy of this pair to the "backup" storage
h

# Remove the text part, keeping only the line number
s/\n.*//

# Swap: bring the backup pair here, put the line number in "backup"
x

# Remove the line number part, keeping only the text
s/.*\n//

# Change all small letters to CAPITAL LETTERS
y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/

# Change "OPERATING SYSTEM" to just "OS"
s/OPERATING SYSTEM/OS/g

# Add this changed text to the "backup" storage (merging with line number)
H

# Bring everything back from "backup" to main view
g

# Replace the newline between them with a " : " separator
s/\n/ : /

# If this is the last line, add a footer message below it
$ a\
----- END OF FILE -----
'
