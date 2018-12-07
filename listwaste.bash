#! /bin/bash

#A script that lists all the names of the files in .waste and their size
#Author: Jay Taylor - U1858209

#if the .waste directory doesnt exist ask if they want to create it
if ! [ -d ~/.waste }; then
        echo -n ".waste directory doesnt exist yet, do you want to create it?   "
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

echo "The file names and size in bytes: "

#For every file in .waste list their name and size in bytes
for filename in ~/.waste/*; do
	byte_size=$(wc -c < $filename)
	echo "The file " ${filename##*/} " is " $byte_size " bytes big" 
done
