#!/usr/bin/bash
shopt -s extglob
flag=0
while true
do
read -p "please enter database name: " name
if [ -z "$name" ]
then
	echo "you must enter databse name"
else
if [ -d DATABASES ]
then
	flag=2
	cd ./DATABASES
	if [ -d $name ]
	then
		echo "database is found chose other name"
		flag=1
	fi
	cd ..
fi
if [ $flag -ne 1 ]
then
case $name in
+([a-zA-Z_]*)) 
	mkdir -p ./DATABASES/$name
	echo "$name database is added"
	break
;;
*)
	echo "please write name of database in write way"		
esac
fi
fi
done

