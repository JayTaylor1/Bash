#! /bin/bash
echo "####################################################################################"
echo "Enter a string and then mash it with another string or press the character * to exit"
echo "NOTE: Entering a * inside a string will also terminate the script"
echo "####################################################################################"
terminate=false
echo -n "First input:	"
while [ "$terminate" = "false" ]; do
	read tempvalue
	full_string+=$tempvalue
	if [[ $tempvalue == *"*"* ]]; then
		terminate=true
		break
	fi
	echo "Current string: " $full_string "	Ready for next input..."
done

echo "Mashed string:	"$full_string

echo -n "Number of digits in the string:  "
echo "$full_string" | tr -dc [:digit:] | wc -c

echo -n "Number of letters in the string: "
echo "$full_string" | tr -dc [:alpha:] | wc -c

echo -n "Number of non-alphanumeric characters in the string: "
echo "$full_string" | tr -dc [:punct:] | wc -c

echo "Total amount of characters:	"${#full_string}


for index in $(seq 0 ${#full_string})
do
	current_character=${full_string:index:1}
	if [ "$current_character" = "*" ]; then
		position=$(("$index" + "1"))
		echo "Position of exit clause ( * ) is: $position"
		break
	fi
done
