#!/usr/bin/bash
while true
do
    read -p "please enter table name: " tbd_name
    if [ -f $tbd_name ]
    then
        while true
        do
        read -p "enter column to delete from: " cold_name
        cold_num=`awk -F: -v cc_name=$cold_name '{if (NR == 1){i=1;while(i <= NF){if ( cc_name == $i) print i;i++}}}' ./$tbd_name`
        if [ $cold_num ]
        then
            while true
            do
            read -p "enter the value: " val_delet
            check_del_val=`awk -F: -v cd_name=$val_delet -v numd_column=$cold_num '{if(NR > 3){if(cd_name == $numd_column) i=i+1}}END{print i}' ./$tbd_name`
            if [ $check_del_val ]
                then
                sed -i "/$val_delet/d" ./$tbd_name
                echo "done"
                break 3
            else
                echo "no such value"
                
            fi
            done
        else
            echo "column not found"
        fi
        done
    else
        echo "table not found"
    fi
done