using System;
using System.Collections.Generic;
using System.Linq;

class Queens
{
	public static void Main(string[] args) {
		Func<int, IEnumerable<IEnumerable<int>>> nqueens = size => {
			Func<int, IEnumerable<IEnumerable<int>>> queen = null;
			queen = n =>
				n <= 0 ?
				new [] {new int [] {}} :
				queen(n-1).SelectMany(a => Enumerable.Range(1, size).Where(b => !a.Contains(b) && !a.Select((c, i) => a.Count()-i-Math.Abs(b-c)).Contains(0)), (a, b) => a.Concat(new [] {b}));
			return queen(size);
		};
		Console.WriteLine(string.Join("\n", nqueens(int.Parse(args[0])).Select(x => string.Join(" ", x))));
	}
}
