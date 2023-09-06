#!/usr/bin/bash
read -p "enter table you want to delete: " del_table
if [ -f $del_table ]
then
    rm $del_table
    echo "$del_table is deleted"
else
    echo "$del_table not fount"
fi