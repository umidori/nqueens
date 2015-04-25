#!/usr/bin/env python

import sys;

def nqueens(size):
    row = [True] * size
    up = [True] * (2*size-1)
    down = [True] * (2*size-1)
    board = [None] * size
    def queen(n):
        if n >= size:
            print ' '.join(map(str, board))
        else:
            for i in range(0, size):
                if row[i] and up[n+i] and down[n-i]:
                   row[i] = up[n+i] = down[n-i] = False
                   board[n] = i+1
                   queen(n+1)
                   row[i] = up[n+i] = down[n-i] = True
    queen(0)

nqueens(int(sys.argv[1]))
