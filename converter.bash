#! /bin/bash

#Script that takes an integer input and converts it to binary octal and hex if its positive if its 
#negative it will ask whether you want the number in twos compliment or sign and magnitude and 
#display the binary output
#Author: Jay Taylor - U1858209

denary=$1
#If there was no arrgument entered read one
if [ "$denary" == "" ]; then
	echo -n "Please enter a integer in the range of -128 < x < 256:	"
	read denary
fi
regular_expression='^[+-]?[0-9]+?$'
#If the input is not an integer (Maybe signed)
if ! [[ $denary =~ $regular_expression ]]; then
	echo "Please enter an integer next time"
	exit
#If the number is out of range do not accept it
elif (( "denary" < "-127" )) || (( "denary" > "255" )); then
	echo "Please enter a number in the range of -128 < x < 256"
	exit
fi
#converting the input to the three outputs
binary=$( bc <<< "obase=2; $denary")
octal=$( bc <<< "obase=8; $denary")
hex=$( bc <<< "obase=16; $denary")
#If the number is negative
if (( "$denary" < "0" )); then
	echo -n "Would you like sign & magnitude (s) or two's compliment (t) for that negative number?	"
	#Input the type of representation for the negative number
	read method
	echo "The inputted number " $denary " converted is: "
	positive_denary=$( bc <<< "$denary*-1")
	binary=$( bc <<< "obase=2; $positive_denary")
	binary_length=${#binary}
	#If the user selected s for sign and magnitude 
	if [ "$authorised" == "s" ] || [ "$method" == "S" ]; then
		#Make it 8 bit
		while [ "$binary_length" != "7" ]; do
			binary=0$binary
			binary_length=${#binary}
		done
		binary=1$binary
		echo "Binary:	"$binary
	#If the user entered t for twos compliment
	elif [ "$method" == "t" ] || [ "$method" == "T" ]; then

		#Make 8 bit
		while [ "$binary_length" != "8" ]; do
                        binary=0$binary
                        binary_length=${#binary}
		done
		#Flip the binary bits and add 1 (base 2)
		inverted_binary=$(tr 01 10 <<< "$binary")
		twos_compliment=$( bc -l <<< "ibase=2;obase=2; $inverted_binary+00000001" )
		echo "Binary:   " $twos_compliment
	else
		echo "Invalid input"
		exit
	fi
#If the number was positive
else
	#make 8 bits
	binary_length=${#binary}
	while [ "$binary_length" != "8" ]; do
                        binary=0$binary
                        binary_length=${#binary}
        done
	#Display the outputs
	echo "The inputted number " $denary " converted is: "
	echo "Binary:		"$binary
	echo "Octal:		"$octal
	echo "Hexadecimal:	"$hex
fi
