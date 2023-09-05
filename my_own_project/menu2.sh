#!/usr/bin/bash

secend_menu=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "prev menu")
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
2) echo "hi $choies2"
;;
3) echo "hi $choies2"
;;
4) echo "hi $choies2"
;;
5) echo "hi $choies2"
;;
6) echo "hi $choies2"
;;
7) echo "hi $choies2"
;;
8) echo "chose from first menu"
break 2
;;
*) echo "the $REPLY is not found"
esac
done
break
else
    echo "database not fount enter right name"
fi
done