#!/usr/bin/bash
while true
do
if [ -d ./DATABASES ]
then
    read -p "enter table you want to drop: " drop_data
    if [ -d ./DATABASES/$drop_data ]
    then 
    rm -r ./DATABASES/$drop_data
    echo "the table" $drop_data "has been droped"
    break
    else
    echo "The table" $drop_data "will not be droped"
    fi
else
    echo "no database with this name"
fi
done