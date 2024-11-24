
module external_iterator

pub fun main()
    var n := 20
    var sum := 0
    to-iter({ fibonacci() })
    // (handler {
    //     ctl yield(j) {
    //         println(j)
    //         sum := sum + j
    //         n := n - 1
    //         if n > 0
    //         then resume(())
    //     }
    // }){
    //     fibonacci()
    // }
    println("sum=" ++ sum.show)

struct iterator {}

effect yield
    ctl yield(i: int): ()

// not sure why `f` needs to be `console`
fun to-iter(f: () -> <yield,console|e> ()): <console|e> iterator
    var res: () -> <console> int := fn () { println("not bound"); 0 }
    (handler {
        ctl yield(j) {
            println(j)
            res := fun () { resume(()) }
            ()
        }
    }){ f() } 
    Iterator()

fun fibonacci() : <div,yield> ()
    var i := 0
    var j := 1
    yield(j)
    while { True }
        val k = i + j
        i := j
        j := k
        yield(j)

