fun main(args: Array<String>) {
    fun nqueens(size: Int): List<List<Int>> {
        fun queen(n: Int): List<List<Int>> {
            if (n <= 0) {
                return listOf(listOf())
            } else {
                return queen(n-1).flatMap{x->(1..size).filter{y->!x.contains(y) && !x.mapIndexed{i,e->Math.abs(y-e)-(x.size-i)}.contains(0)}.map{y->x+listOf(y)}}
            }
        }
        return queen(size)
    }

    println(nqueens(args[0].toInt()).map{x->x.joinToString(" ")}.joinToString("\n"))
}
