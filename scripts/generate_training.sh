#!/bin/bash

#declare -a fonts=("arial" "helvetica" "Palatino-Bold")
fonts=(`convert -list font | grep Font | tr -s ' ' | cut -d\  -f 3`)
stretches=(`convert -list stretch`)

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
    font=${fonts[$RANDOM % ${#fonts[@]} ]}
    stretch=${stretches[$RANDOM % ${#stretches[@]} ]}
    point_size=72
    printf "%s,%s\n" ${word} ${font}
    convert -size 560x85 xc:"rgba(${b_red},${b_green},${b_blue,${b_alpha}})" -font "${font}" -pointsize ${point_size} \
            -stretch "${stretch}" -draw "text 25,60 '${word}'" -channel RGBA -gaussian 0x6 \
            -fill "rgba(${f_red},${f_green},${f_blue,${f_alpha}})" -stroke "rgba(${s_red},${s_green},${s_blue},${s_alpha})" \
            -draw "text 20,55 '${word}'" \
            "${i}_${word}.png"
    i=$((i+1))
    shift
done
