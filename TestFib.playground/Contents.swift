import UIKit

class Fibna {
    static func fib(_ n: Int) -> Int {
        if (n < 2) {
            return n
        }
        
        var first = 0
        var second = 1
        for _ in 0..<n-2 {
            let sum = first + second
            first = second
            second = sum
        }
        
        return second
    }
}

// 0 1 1 2 3 5 8 13 21
Fibna.fib(8)
