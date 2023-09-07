#!/usr/bin/bash
while true
do
read -p "enter table name: " tb_name_sel
i=1
if [ -f $tb_name_sel ]
then
    while true
    do
    read -p "enter column name: " col_name
    col_num=`awk -F: -v cc_name=$col_name '{if (NR == 1){i=1;while(i <= NF){if ( cc_name == $i) print i;i++}}}' ./$tb_name_sel`
        if [ $col_num ]
        then
            awk -F: -v co=$col_num '{if( NR != 2){print $co}}' ./$tb_name_sel
            break 2
        else
            echo "column not found"
        fi
        if [[ $col_name = "*" ]]
        then
            awk '{if( NR != 2){print $0}}' ./$tb_name_sel
            break 2
        fi
    done
else
    echo "table not found"
fi
done