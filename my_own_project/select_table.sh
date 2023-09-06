#!/usr/bin/bash
while true
do
read -p "enter table name: " tb_name_sel
i=1
if [ -f $tb_name_sel ]
then
    no_of_col=`awk -F: '{if (NR == 1)print NF}' ./$tb_name_sel`
    while true
    do
    read -p "enter column number: " col_number
    if [ $col_number -lt $no_of_col ]
    then
        awk -F: -v co=$col_number '{print $co}' ./$tb_name_sel
        break 2
    else
        echo "column not found"
    fi
    done
else
    echo "table not found"
fi
done