object Queens {
    def main(args: Array[String]) {
        val size = args(0).toInt
        val row = Array.fill(size)(true)
        val up = Array.fill(2 * size - 1)(true)
        val down = Array.fill(2 * size - 1)(true)
        val board = new Array[Int](size)
        var queen: (Int) => Unit = null
        queen = (n) => {
            if (n >= size) {
                for (i <- 0 until board.size - 1) print(board(i) + " ")
                println(board(board.size - 1))
            } else {
                for (i <- 0 until board.size) {
                    if (row(i) && up(n+i) && down(n-i+size-1)) {
                        row(i)=false; up(n+i)=false; down(n-i+size-1)=false
                        board(n) = i + 1
                        queen(n + 1)
                        row(i)=true; up(n+i)=true; down(n-i+size-1)=true
                    }
                }
            }
        }
        queen(0)
    }
}
