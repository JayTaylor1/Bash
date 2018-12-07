#! /bin/bash

#This command outputs x amount of lins from the start or the end of every file in a directory
#Author: Jay Taylor - U1858209

head_or_tail=$1
number_of_lines=$2
directory=$3
number_of_files=$(ls $3)
counter=0

#Usage
if [ $# -lt 3 ]; then
	echo "Usage of the command is <head/tail> <Amount Of Lines> <directory>"
	exit
fi


#Check if directory exists
if [ ! -d "$directory" ]; then
	echo "Directory does not exist"
	exit
fi
#Checks if number is valid
if ((number_of_lines < 1 | number_of_lines >= 20)); then
	echo "Please enter a number in the range 1-20"
	exit
fi

#For every file in directory
for file in $number_of_files
do
	#if current files is directory then skip
	if [ -d $file ]; then
		continue
	fi
	#if the file is readable
	if [ -r $file ]; then
		#if the user inputted head
		if [ $1 == "head" ]; then
			echo "*******************************"
			echo "The file > " $file " " $1 " is:"
			head -$number_of_lines $file 
			#Counter for files displayed
			counter=$[counter +1]
		#if the user inputted tail
		elif [ $1 == "tail" ]; then
			echo "*******************************"
                	echo "The file > " $file " " $1 " is:"
                	tail -$number_of_lines $file
			#Counter for files displayed
			counter=$[counter +1]
		else
			#If head/tale argument isnt valid
			echo "Please enter head or tail next time"
			exit
		fi
	fi
done
#If no files are displayable:
if [ $counter == 0 ]; then
	echo "No readable files"
else
	echo "*******************************"
	echo "Total number of files displayes: " $counter
fi
