#!/usr/bin/bash
shopt -s extglob
read -p "ebter table to insert: " tb_name
if [ -f $tb_name ]
then
    x=`awk -F: '{if (NR == 1)print NF}' ./$tb_name`
    i=1
    while ((i <= x))
    do
        while true
        do
        read -p "enter data of $(awk -v z=$i -F: '{if(NR == 1 && z != 1){print $z} else if(z == 1 && NR == 1){print $z " (PK)"}}' ./$tb_name): " data
        if [[ -z $data ]]
        then
            echo "you must enter data"
        else
        if [[ $data =~ .*:.* ]]
        then
            echo "not allowed to insert :"
        else
        if [[ $(awk -F: -v dd=$data '{if( dd == $1) print "t"}' ./$tb_name) == "t" && $i -eq 1 ]]
        then
            echo "primary key not repeted"
        else
        if [ $(awk -v z=$i -F: '{if(NR == 2){print $z}}' ./$tb_name) = "int" ]
        then
            case $data in
            +([0-9]))
                ro="$ro$data"
                if [ $(($i)) -ne $x ]
                then
                        ro="$ro:" 
                fi
                break
            ;;
            *)
                echo "you not allowed to insert text"
            esac
        elif [ $(awk -v z=$i -F: '{if(NR == 2){print $z}}' ./$tb_name) = "string" ]
        then
            case $data in
            +([a-zA-z]))
                ro="$ro$data"
                if [ $(($i)) -ne $x ]
                then
                        ro="$ro:" 
                fi
                break
            ;;
            *)
                echo "you not allowed to insert int"
            esac
        fi
        fi
        fi
        fi
        done
        i=$(($i+1))
    done
        echo "$ro" >> $tb_name
        ro=""


else
    echo "table not found"
fi