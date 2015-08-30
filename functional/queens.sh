#!/usr/bin/env bash

n=$1

queen ()
{
    if (($1<=0)); then
        echo
    else
        queen $(($1-1)) |
        awk '{for(i=1;i<='$n';++i){for(j=1;j<=NF;++j)if($j==i||$j-j==i-NF-1||$j+j==i+NF+1)break;if(j>NF)print $0,i}}'
    fi
}

queen $1
