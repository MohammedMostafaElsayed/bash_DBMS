#!/usr/bin/bash

secend_menu=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "prev menu" "exit")
while true
do
read -p "please enter the name of database: " name
if [ -d ./DATABASES/$name ]
then
cd ./DATABASES/$name
select choies2 in "${secend_menu[@]}"
do
case $REPLY in
1) . ../../create_table.sh
;;
2) . ../../list_table.sh
;;
3) . ../../drop_table.sh
;;
4) . ../../insert_table.sh
;;
5) . ../../select_table.sh
;;
6) . ../../delete_from_table.sh
;;
7) . ../../update_table.sh
;;
8)
cd ../..
. ./main.sh
break 2
;;
9)exit 0
;;
*) echo "the $REPLY is not found"
esac
done
break
else
    echo "database not fount enter right name"
fi
done