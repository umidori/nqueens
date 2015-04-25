#!/usr/bin/env awk -f

BEGIN {
    size = ARGV[1]
    queen(0)
}

function queen(n, i) {
    if (n >= size) {
        for (i = 0; i < size-1; ++i) {
            printf("%s ", board[i])
        }
        printf("%s\n", board[i])
    } else {
        for (i = 0; i < size; ++i) {
            if (!row[i] && !up[n+i] && !down[n-i]) {
                row[i]=up[n+i]=down[n-i]=1
                board[n]=i + 1
                queen(n + 1)
                row[i]=up[n+i]=down[n-i]=0
            }
        }
    }
}
