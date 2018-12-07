#! /bin/bash

#A script that takes a filename and lists the amount of all the characters in the alphabet and also
#lists the tally of all the numbers form 0-9, the script also outputs the total amount 
#of letters numbers and spaces.
#Author: Jay Taylor - U1858209

#takes the filename argument 
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

#Check if the file exists    
if ! [ -f $filename ]; then
	echo "File $filename does not exist."
	exit
fi

#sets the counting vasirables
letter_tally=0
number_tally=0

echo "#########################################"
echo "Tally of letters in " $filename ":"

#Goes throught the alphabet and outputs the total of the lowercase + uppercase of the letter
for lowercase_letter in {a..z}; do
	#Gets the number of lowercase letters in the file
	lowercase_number=$(grep -o ${lowercase_letter}  $filename | wc -l)
	#Makes the letter capital
	capital_letter="$(tr '[:lower:]' '[:upper:]' <<< ${lowercase_letter})"
	#gets the number of uppercase numbers in the file
	uppercase_number=$(grep -o $capital_letter  $filename | wc -l)
	#calculates the occurances of the current letter
	total_letters=$(( lowercase_number + uppercase_number ))
	#Increases the count
	letter_tally=$((letter_tally + total_letters ))
        echo $capital_letter "/"  ${lowercase_letter}": "  $total_letters
done

echo "#########################################"
echo "Tally of numbers in " $filename ":"

#goes through the numbers 0-9 and outputs the amount of each number in the file
for number in {0..9}; do
	#Gets the number of occurances of the current digit
	number_occurance=$(grep -o ${number}  $filename | wc -l)
	#Increases the count
	number_tally=$((number_tally + number_occurance))
	echo "${number}: "$number_occurance
done

#Outputs the amount of spaces in the file
spaces=$(grep -o ' ' $filename  | wc -l) 
echo "#########################################"
echo "Total number of letters:	"$letter_tally
echo "Total number of spaces:		" $spaces
echo "Total number of digits:		" $number_tally
echo "#########################################"

