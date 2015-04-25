#!/usr/bin/env swift

var size = 0
if C_ARGC > 1 {
    size = String.fromCString(C_ARGV[1])!.toInt()!
}

func is_safe(x: [Int], y: Int) -> Bool {
    return !contains(x, y) && !contains((0..<x.count).map{x.count-$0-abs(y-x[$0])}, 0)
}

func queen(n: Int) -> [[Int]] {
    if n <= 0 {
        return [[]]
    } else {
        return queen(n - 1).map{x in (1...size).map{$0}.filter{y in is_safe(x, y)}.map{y in x+[y]}}.reduce([], +)
    }
}

println(join("\n", queen(size).map{join(" ", $0.map{$0.description})}))
