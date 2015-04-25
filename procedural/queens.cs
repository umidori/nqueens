using System;
using System.Linq;

class Queens
{
    public static void Main (string[] args) {
        var size = int.Parse(args[0]);
        var row = Enumerable.Repeat<bool>(true, size).ToArray();
        var up = Enumerable.Repeat<bool>(true, 2*size-1).ToArray();
        var down = Enumerable.Repeat<bool>(true, 2*size-1).ToArray();
        var board = new int[size];
        Action<int> queen = null;
        (queen = n => {
            int i;
            if (n >= size) {
                for (i = 0; i < size-1; ++i) {
                    Console.Write("{0} ", board[i]);
                }
                Console.Write("{0}\n", board[i]);
            } else {
                for (i = 0; i < size; ++i) {
                    if (row[i] && up[n+i] && down[n-i+size-1]) {
                        row[i] = up[n+i] = down[n-i+size-1] = false;
                        board[n] = i+1;
                        queen(n+1);
                        row[i] = up[n+i] = down[n-i+size-1] = true;
                    }
                }
            }
        })(0);
    }
}
