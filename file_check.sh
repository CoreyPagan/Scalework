#!/bin/bash
# Script to check for existence of a file and optionally create one if non existent.
# Will also prompt user to check for filetype and will do so if requested.

echo "Welcome $USER, this script will help you locate a file and it's type"

# Prompts user for the filename
read -p "What is the name of the file you are searching for? " file

# Prompts user for the directory of the file
echo "In what directory do you think the file is located?" 
echo "If you aren't sure, just put a parent directory, I will search recursively"
read -p "Enter a Directory: " dir

# Change to the specified directory
# If directory is nonexistent, send error code to /dev/null so user doesn't see it.
cd "$dir" 2>/dev/null 

# Check if the directory change was successful
# Check the last command exit code with $?, if not equal to 0, echo failure message
if [ $? -ne 0 ]; then 
  echo "Cannot locate the directory '$dir'. Please check the path."
  exit 1
fi

# Prompts the user if they are an admin
read -p "Are you an Admin? (y/n): " admin

# Check users response and use sudo if y
# Check if the file exists within the specified directory or subdirectories
# Piping to grep produces the error code needed for the next if statement.
if [ "$admin" = "y" ]; then
    sudo find $dir -name "$file" | grep . 
elif [ "$admin" = "n" ]; then
    find $dir -name "$file" | grep . 
else
    echo "Only the characters 'y' or 'n' are allowed"
	exit 0
fi
	
# Checks if there is stderr from the last command, if so outputs failure message, if not outputs success
# If failure, prompts user with request to create file
# If user is an Admin, then sudo is used to create a file
if [ $? == 0 ]; then
  echo "File '$file' exists."	
else
  echo "File '$filename' does not exist in the directory or subdirectories of '$dir'."
  read -p "Would you like to create it? (y/n): " create
	if [ "$create" = "y" -a "$admin" = "y" ]; then
		sudo touch $file
		echo "File '$file' created as Admin"
	elif [ "$create" = "y" ]; then
		touch $file
		echo "File '$file' created"
	elif [ "$create" = "n" ]; then
		echo "Ok, No file created"
	else
		echo "Only the characters 'y' or 'n' are allowed, exiting without creating file"
	fi
fi

# Prompts user if they would like to check for file type
# Uses file command to check for file type
read -p "Would you like to identify a file type? (y/n): " type
if [ "$type" = "y" ]; then
	# Prompt user for file path
	read -p "Enter the file path: " file_path
	# Check if the file exists
	if [ -e "$file_path" ]; then
    	# Use the `file` command to identify the file type
    	file_type=$(file -b "$file_path")
    	echo "The file type is: $file_type"
	else
    	echo "File does not exist."
	fi
elif [ "$type" = "n" ]; then
	echo "Ok!"
else
	echo "Only the characters 'y' or 'n' are allowed, exiting without checking file type"
fi