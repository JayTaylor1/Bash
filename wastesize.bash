#! /bin/bash

#This script reports the number of files in the waste bin
#Aurthor: Jay Taylor - U1858209

#Checks if directory exists
if ! [ -d ~/.waste ]; then
	echo ".waste directory doesnt exist yet do you want to create it? (y/n)"
	read create
	#If the directory doesnt exist ask if they want to create one
	if [ "$create" == "y" ] || [ "$create" == "Y" ]; then
		mkdir ~/.waste
		echo ".waste directory created successfully"
	else
		echo ".waste directory not created"
		exit
	fi
fi

#gets the number of files 
number_of_files=$(ls ~/.waste | wc -w)

#Outputs the correct grammer for the amount of files in the .waste directory
if (( number_of_files == 1)); then
	echo "There is One file in the waste directory"
elif (( number_of_files == 0 )); then
	echo "The waste directory is empty"
else 
	echo "There are " $number_of_files " files in the waste directory"
fi
