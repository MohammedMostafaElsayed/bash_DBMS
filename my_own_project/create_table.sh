#!/usr/bin/bash

while true
do
read -p "enter table name: " table
if [ "$table" = "" ]
then
echo "you must enter table name"
elif [ -f $name ]
then
echo "database is founded chose other name"
else
case $name in
+([a-zA-Z_]*)) mkdir -p ./DATABASES/$name
echo "$name database is added"
break
;;
*)
echo "please write name of database in write way"
esac
fi
done
read -p "enter number of column: " num
i=0
while((i < num))
do
while true
do
read -p "enter $((i+1)) column name: " name

