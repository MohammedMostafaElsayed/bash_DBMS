#!/usr/bin/bash
shopt -s extglob
flag=0
while true
do
read -p "please enter table name: " name_tb
if [ -z "$name_tb" ]
then
	echo "you must enter table name"
else
if [ -f $name_tb ]
then
	echo "table is found chose other name"
else
case $name_tb in
+([a-zA-Z_]*)) 
    touch $name_tb
    echo "$name_tb table is created"
    flag=1
    break
;;
*)
    echo "please write name of table in right way"		
esac
fi
fi
done

if [ $flag -eq 1 ]
then
    flag2=0
    data_type=("int" "char" "string")
    array_col_name=()
    read -p "plese enter number of colom: " num
    i=0
    while ((i < $num))
    do
        while true
        do
            read -p "please enter name of column no $(($i+1)): " col_name
            if [ -z "$col_name" ]
            then
                echo "you must enter column name"
            else
                for coll in "${array_col_name}"; 
                do
                    if [ "$col_name" = "$coll" ]
                    then
                    echo "$col_name is founded before chose other name"
                    flag2=1;
                    fi
                done 
                if [ $flag2 -ne 1 ]
                then
                    case $col_name in
                    +([a-zA-Z_]*))
                        array_col_name[i]=$col_name
                        row="$row$col_name"
                        if [ $(($i+1)) -ne $num ]
                        then
                        row="$row:" 
                        fi
                        break
                    ;;
                    *)
                        echo "please write name of column in right way"		
                    esac
                fi
            fi
        done
            read -p "plese ender data type: " col_type
            array_col_type[i]=$col_type
            i=$(($i+1))
    done
        echo "$row" >> $name_tb
fi
