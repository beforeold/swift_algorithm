//
//  main.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

let stack = Stack<Int>()

let count = 5

for i in 0..<count {
    stack.push(i)
}

for _ in 0..<count {
    print(stack.pop())
}

public extension CustomStringConvertible {
    func printed() {
        print(self)
    }
}

public extension Bool {
    func assertTrue() {
        assert(self == true)
    }
    
    func assertFalse() {
        assert(self == false)
    }
}

Solution.browser()


Solution.isValid("{}}").assertFalse()
Solution.isValid("{}").assertTrue()
Solution.isValid("{}[]").assertTrue()
Solution.isValid("{}[]()").assertTrue()
Solution.isValid("{[()]}").assertTrue()
Solution.isValid("").assertTrue()
