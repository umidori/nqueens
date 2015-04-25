using System;
using System.Collections.Generic;
using System.Linq;

class Queens
{
    public static void Main (string[] args) {
        Console.WriteLine(string.Join("\n", from x in nqueens(int.Parse(args[0])) select string.Join(" ", from y in x select y.ToString())));
    }

    private static IEnumerable<List<int>> nqueens(int size) {
        Func<int, IEnumerable<List<int>>> queen = null;
        queen = n => {
            if (n <= 0) {
                return new List<List<int>>() { new List<int>() };
            } else {
                return from x in queen(n-1) from y in Enumerable.Range(1, size) where !x.Contains(y) && !(from i in Enumerable.Range(0, x.Count) select x.Count-i-Math.Abs(y-x[i])).Contains(0) select Concat(x, y);
            }
        };
        return queen(size);
    }

    private static List<int> Concat(List<int> x, int y) {
        var a = new List<int>();
        a.AddRange(x);
        a.Add(y);
        return a;
    }
}
