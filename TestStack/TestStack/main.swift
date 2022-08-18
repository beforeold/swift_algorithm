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

Solution.browser()
