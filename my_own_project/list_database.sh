#!/usr/bin/bash
flag=0
if [ -d ./DATABASES ]
then
    cd ./DATABASES
    for item in `ls .`
    do
        if [ -d $item ]
        then
            echo "$item"
            flag=$(($flag+1))
        fi
    done
    if [ $flag -eq 0 ]
    then
        echo "no database to list it"
    fi
    cd ..
else
    echo "no database to list it"
fi



