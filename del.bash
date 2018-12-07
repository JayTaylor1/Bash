#! /bin/bash

#This programs copy files to a special .waste directory
#Author: Jay Taylor - U1858209

filename=$1
#If the argument is blank
if [ "$filename" == "" ]; then
	echo "Please enter a filename:"
	#input a filename
	read filename
	if [ " $filename" == "" ]; then
		echo "Invalid Input"
		exit	
	fi
fi

#If the .waste directory doesnt exist yet create it
if ! [ -d ~/.waste/  ]; then
	echo "No .waste directory found, creating in home directory..."
	mkdir ~/.waste
fi

#If the File Exists
if [ -e $filename ]; then
	#Copy it to waste
	cp $filename ~/.waste/ 
else
	echo "File does not exist"
	exit
fi
