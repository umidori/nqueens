#!/usr/bin/env python

import sys

def nqueens(size):
    def queen(n):
        if n <= 0:
            return [[]]
        else:
            return [x+[y] for x in queen(n-1) for y in range(1,size+1) if y not in x and 0 not in [abs(y-j)-(len(x)-i) for (i,j) in enumerate(x)]]
    return queen(size)

print '\n'.join([' '.join([str(x) for x in y]) for y in nqueens(int(sys.argv[1]))])
