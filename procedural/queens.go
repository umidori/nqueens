package main

import ("fmt"; "os"; "strconv")

func main() {
    size, _ := strconv.Atoi(os.Args[1])
    row := make([]bool, size)
    up := make([]bool, 2 * size - 1)
    down := make([]bool, 2 * size - 1)
    board := make([]int, size)

    var queen func(int)
    queen = func(n int) {
        var i int

        if n >= size {
            for i = 0; i < size - 1; i++ {
                fmt.Printf("%d ", board[i])
            }
            fmt.Println(board[i])
        } else {
            for i = 0; i < size; i++ {
                if !row[i] && !up[n+i] && !down[n-i+size-1] {
                    row[i], up[n+i], down[n-i+size-1] = true, true, true
                    board[n] = i + 1
                    queen(n + 1)
                    row[i], up[n+i], down[n-i+size-1] = false, false, false
                }
            }
        }
    }
    queen(0)
}
