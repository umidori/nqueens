#!/usr/bin/env swift

var size = 0
if C_ARGC > 1 {
    size = String.fromCString(C_ARGV[1])!.toInt()!
}

var row = [Bool](count: size, repeatedValue: true)
var up = [Bool](count: 2 * size - 1, repeatedValue: true)
var down = [Bool](count: 2 * size - 1, repeatedValue: true)
var board = [Int](count: size, repeatedValue: 0)

func queen(n :Int) {
    var i: Int

    if n >= size {
        for (i  = 0; i < size - 1; ++i) {
            print(board[i]); print(" ")
        }
        println(board[i])
    } else {
        for i in 0..<size {
            if (row[i] && up[n+i] && down[n-i+size-1]) {
                (row[i], up[n+i], down[n-i+size-1]) = (false, false, false);
                board[n] = i + 1;
                queen(n + 1);
                (row[i], up[n+i], down[n-i+size-1]) = (true, true, true);
            }
        }
    }
}

queen(0)
