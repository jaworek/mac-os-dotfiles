#!/bin/sh

# Script that installs stuff from Homebrew and puts it in the file to keep track of installed packages
# and easier backup and restore

brew install something
# check if program already exists in the list
echo "something" | ./brew_programs.txt
