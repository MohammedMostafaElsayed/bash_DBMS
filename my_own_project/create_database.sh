#!/usr/bin/bash
shopt -s extglob
while true
do
read -p "please enter name of database: " name
if [ "$name" = "" ]
then
echo "you must enter name of database"
elif [ -d $name ]
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
