#!/usr/bin/bash

#make first selector menue
first_menu=("Create Database" "List Databases" "Connect To Databases" "Drop Database" "exit")
PS3="Select from menu one: "
select choies in "${first_menu[@]}"
do
case $REPLY in
1) . ./create_database.sh
;;
2) . ./list_database.sh
;;
3) . ./menu2.sh
;;
4) . ./drop_database.sh
;;
5)exit 0
;;
*) echo "the $REPLY is not found"
esac
done

