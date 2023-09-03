#!/usr/bin/bash

secend_menu=("Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" "Update Table" "prev menu")
select choies2 in "${secend_menu[@]}"
do
case $REPLY in
1) echo "hi $choies2"
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
break
;;
*) echo "the $REPLY is not found"
esac
done
