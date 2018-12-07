#! /bin/bash

#Script that takes strings as input and joins (mashes) them until an exit clause ( * ) is entered 
#once entered the script will output its position in the string, the amount of letters in the string
#along with the amount of digits and non alphanumeric characters
#Author: Jay Taylor - U1858209


echo "####################################################################################"
echo "Enter a string and then mash it with another string or press the character * to exit"
echo "NOTE: Entering a * inside a string will also terminate the script"
echo "####################################################################################"
#sets the exot clause
terminate=false
echo -n "First input:	"
#While exit clause is not met (=false) loop
while [ "$terminate" = "false" ]; do
	#read the value
	read tempvalue
	#Add it to the string
	full_string+=$tempvalue
	#If the new string contains the value trigger the exit clause
	if [[ $tempvalue == *"*"* ]]; then
		terminate=true
		break
	fi
	echo "Current string: " $full_string "	Ready for next input..."
done

#Display the full string"
echo "Mashed string:	"$full_string
#Display the number of digits in the string
echo -n "Number of digits in the string:  "
echo "$full_string" | tr -dc [:digit:] | wc -c
#Display the number of letters in the string
echo -n "Number of letters in the string: "
echo "$full_string" | tr -dc [:alpha:] | wc -c
#Display the number of non alphanumneric characters NOTE not ( £ )
echo -n "Number of non-alphanumeric characters in the string: "
echo "$full_string" | tr -dc [:punct:] | wc -c
#Displays the total amount of characters
echo "Total amount of characters:	"${#full_string}

#Finds the location of the exit clause ( * )
for index in $(seq 0 ${#full_string})
#For every character in string
do
	current_character=${full_string:index:1}
	#If the character is equal to ( * ) the
	if [ "$current_character" = "*" ]; then
		position=$(("$index" + "1"))
		#Output its posititon
		echo "Position of exit clause ( * ) is: $position"
		break
	fi
done
