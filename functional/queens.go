package main

import (
	"fmt"
	"os"
	"strconv"
)

func main() {
	nqueens := func(size int) [][]int {
		var queen func(int) [][]int
		queen = func(n int) [][]int {
			var q [][]int
			if n == 0 {
				q = [][]int{[]int{}}
			} else {
				for _, a := range queen(n - 1) {
				next:
					for i := 1; i <= size; i++ {
						for j, b := range a {
							if i == b || n-j-1 == i-b || n-j-1 == b-i {
								continue next
							}
						}
						b := make([]int, n)
						copy(b, a)
						b[n-1] = i
						q = append(q, b)
					}
				}
			}
			return q
		}
		return queen(size)
	}

	size, _ := strconv.Atoi(os.Args[1])
	for _, board := range nqueens(size) {
		for i := 0; i < size-1; i++ {
			fmt.Printf("%d ", board[i])
		}
		fmt.Println(board[size-1])
	}
}
