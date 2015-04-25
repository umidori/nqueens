object Queens {
    def main(args: Array[String]) {
        val size = args(0).toInt
        var queen: (Int) => List[List[Int]] = null
        queen = (n) => {
            if (n <= 0) {
                List(List())
            } else {
                queen(n-1).
                flatMap(x=>(1 to size).
                    collect{case y if !x.contains(y) &&
                                      !x.zipWithIndex.map{z=>x.size-z._2-(y-z._1).abs}.contains(0)
                            =>x:+y})
            }
        }
        println(queen(size).map(_.mkString(" ")).mkString("\n"))
    }
}
