fun main(args: Array<String>) { 
    fun nqueens(size: Int) {
        val row   = BooleanArray(size){true}
        val up    = BooleanArray(2*size-1){true}
        val down  = BooleanArray(2*size-1){true}
        val board = IntArray(size)
        fun queen(n: Int) { 
            if (n >= size) { 
                for (i in 0..size-2) { 
                    print("${board[i]} ")
                } 
                println("${board[size-1]}")
            } else { 
                for (i in 0..size-1) { 
                    if (row[i] && up[n+i] && down[n-i+size-1]) { 
                        row[i]           = false
                        up[n+i]          = false
                        down[n-i+size-1] = false
                        board[n] = i+1
                        queen(n+1)
                        row[i]           = true
                        up[n+i]          = true
                        down[n-i+size-1] = true
                    } 
                } 
            } 
        }
        queen(0)
    }
    nqueens(args[0].toInt())
}
