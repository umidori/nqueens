#!/usr/bin/env bash

size=$1
row=()
up=()
down=()
board=()

queen() {
    local i

    if (($1 >= size)); then
        echo ${board[@]}
    else
        for ((i = 1; i <= size; ++i)); do
            if ((!row[i] && !up[$1+i] && !down[$1-i+size])); then
                ((row[i] = up[$1+i] = down[$1-i+size] = 1))
                board[$1]=$i
                queen $(($1 + 1))
                ((row[i] = up[$1+i] = down[$1-i+size] = 0))
            fi
        done
    fi
}

queen 0
