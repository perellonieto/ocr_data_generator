#!/bin/bash

#declare -a fonts=("arial" "helvetica" "Palatino-Bold")
families=(`fc-list : family`)

i=0
while [[ $# -gt 0 ]]; do
    word="$1"
    b_red=$(( RANDOM % 100 ))
    b_green=$(( RANDOM % 100 ))
    b_blue=$(( RANDOM % 100 ))
    b_alpha=$(( RANDOM % 100 ))
    f_red=$(( RANDOM % 100 ))
    f_green=$(( RANDOM % 100 ))
    f_blue=$(( RANDOM % 100 ))
    f_alpha=$(( RANDOM % 100 ))
    s_red=$(( RANDOM % 100 ))
    s_green=$(( RANDOM % 100 ))
    s_blue=$(( RANDOM % 100 ))
    s_alpha=$(( RANDOM % 100 ))
    # FIXME: some families throw an error
    family=${families[$RANDOM % ${#families[@]} ]}
    point_size=72
    printf "%s\n" ${word}
    convert -size 560x85 xc:"rgba(${b_red},${b_green},${b_blue,${b_alpha}})" -family "${family}" -pointsize ${point_size} \
            -draw "text 25,60 '${word}'" -channel RGBA -gaussian 0x6 \
            -fill "rgba(${f_red},${f_green},${f_blue,${f_alpha}})" -stroke "rgba(${s_red},${s_green},${s_blue},${s_alpha})" \
            -draw "text 20,55 '${word}'" \
            "${i}_${word}.png"
    i=$((i+1))
    shift
done
