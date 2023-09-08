#!/usr/bin/bash
shopt -s extglob
while true
do
    read -p "please enter table name: " tbu_name
    if [ -f $tbu_name ]
    then
        while true
        do
        read -p "enter column to update from: " colu_name
        colu_num=`awk -F: -v cc_name=$colu_name '{if (NR == 1){i=1;while(i <= NF){if ( cc_name == $i) print i;i++}}}' ./$tbu_name`
        if [ $colu_num ]
        then
            while true
            do
            read -p "enter the old value: " val_update
            check_u_val=`awk -F: -v cu_name=$val_update -v numu_column=$colu_num '{if(NR > 3){if(cu_name == $numu_column) i=i+1}}END{print i}' ./$tbu_name`
            if [ $check_u_val ]
            then
                read -p "enter new value: " new_val
                check=`awk -F: -v re_val=$new_val '{if(re_val == $1)print 1}' ./$tbu_name`
                if [[ $colu_num -eq 1 && $check -eq 1 ]]
                then
                    echo "not allow to enter repeted value"
                else
                type_old_value=`awk -F: -v new=$colu_num '{if(NR == 2)print $new}' ./$tbu_name`
                if [ $type_old_value = "int" ]
                then
                    case $new_val in
                    +([0-9])) sed -i "s/$val_update/$new_val/g" ./$tbu_name
                    echo "done"
                    break 3
                    ;;
                    *) echo "enter int only"
                    esac
                elif [ $type_old_value = "string" ]
                then
                    case $new_val in
                    +([a-zA-z])) sed -i "s/$val_update/$new_val/g" ./$tbu_name
                    echo "done"
                    break 3
                    ;;
                    *) echo "enter int only"
                    esac
                fi  
                fi
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