#! /bin/bash

#Script that takes a file by its filename and makes it executable
#Author: Jay Taylor - U1858209

filename=$1
#No Input
if [ "$filename" == "" ]; then
	echo "Please enter a filename"
	read filename
	if [ "$filename" == "" ]; then
        	echo "Invalid Filename"
        	exit
	fi
fi
#File Exists
if [ -e $filename ]; then
	echo "File Exists..."
else
	echo "File Does Not Exist, please try again"
	exit
fi

#File is executable
if [ -x $filename ];  then
	echo "File is already Executable, please try again"
	exit
else 
	echo "File is not yet executable..."
fi

#Make file executable

chmod +x $filename
echo "File $filename is now executable"
