
module external_iterator

pub fun main()
    var n := 10
    with handler
      ctl yield(j)
          println(j)
          n := n - 1
          if n > 0
              then resume(())
    fibonacci()

effect yield
    ctl yield(i: int): ()

fun fibonacci() : <div, yield> ()
    var i := 0
    while { i < 10 }
        yield(i)
        i := i + 1
