#!/usr/bin/env node

function nqueens(size) {
    'use strict';
    var row=[], up=[], down=[], board=[];

    (function queen(n) {
        if (n >= size) {
            console.log(board.join(' '));
        } else {
            for (var i = 0; i < size; ++i) {
                if (!row[i] && !up[n+i] && !down[n-i+size-1]) {
                    row[i]=up[n+i]=down[n-i+size-1]=1;
                    board[n] = i+1;
                    queen(n+1);
                    row[i]=up[n+i]=down[n-i+size-1]=0;
                }
            }
        }
    }(0));
}

nqueens(process.argv[2]);
