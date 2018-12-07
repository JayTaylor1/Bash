#! /bin/bash

#A script to permanently delete everything in the .waste directory
#Author: Jay Taylor - U1858209

#if the .waste directory doesnt exist ask if they want to create it
if ! [ -d ~/.waste }; then
	echo -n ".waste directory doesnt exist yet, do you want to create it?	"
	read create
	if [ "$create" == "y" ] || [ "$create" == "Y" ]; then
		mkdir ~/.waste
		echo "Directory created"
		exit
	else
		echo "Directory not created"
		exit
	fi
fi

#Verification 
echo "Are you sure you want to delete everything from the waste bin (Y/N)"
read authorised
#If verified then clear waste directory
if [ "$authorised" == "y" ] || [ "$authorised" == "Y" ]; then
	rm -r ~/.waste/*
	echo "Files removed"
#If not verified then keep waste directory
elif [ "$authorised" == "n" ] || [ "$authorised" == "N" ]; then
	echo "No selected, exiting..."
	exit
#if input not valid
else
	echo "Invalid Input"
	exit
fi
