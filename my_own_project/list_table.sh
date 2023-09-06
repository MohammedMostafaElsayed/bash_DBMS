#!/usr/bin/bash
flag=0
for table in `ls .`;
do
    if [ -f $table ]
    then
        echo "$table"
        flag=$(($flag+1))
    fi
done
if [ $flag -eq 0 ]
then
    echo "no table founded"
fi