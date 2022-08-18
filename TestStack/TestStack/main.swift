//
//  main.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

func testStack() {
    let stack = Stack<Int>()

    let count = 5

    for i in 0..<count {
        stack.push(i)
    }

    for _ in 0..<count {
        print(stack.pop())
    }
}

func testBrowser() {
    Solution.browser()
}

func testIsValid() {
    Solution.isValid("{}}").assertFalse()
    Solution.isValid("{}").assertTrue()
    Solution.isValid("{}[]").assertTrue()
    Solution.isValid("{}[]()").assertTrue()
    Solution.isValid("{[()]}").assertTrue()
    Solution.isValid("").assertTrue()
}

func testQueueBackedWithStack() {
    let queue = QueueBackedWithStack<Int>()
    let count = 5
    for i in 0..<count {
        queue.push(i)
        
        let popRet = queue.pop()
        (popRet == i).assertTrue()
    }
    
    count.enumerate(queue.push)
    
    for i in 0..<count {
        (queue.pop() == i).assertTrue()
    }
}

print("--- testQueueBackedWithStack")
testQueueBackedWithStack()
