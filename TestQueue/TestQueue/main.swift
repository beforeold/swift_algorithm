//
//  main.swift
//  TestQueue
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

func testQueue() {
    let queue = Queue<Int>()

    let count = 5
    for i in 0..<count {
        queue.push(i)
    }

    for _ in 0..<count {
        print(queue.pop())
    }
}

func testStackBackedWithQueue() {
    let stack = StackBackedWithQueue<Int>()
    
    stack.push(0)
    stack.push(1)
    assert(stack.pop() == 1)
    stack.push(2)
    stack.push(3)
    assert(stack.size() == 3)
    assert(stack.peek() == 3)
    
    let count = 5
    for i in 0..<count {
        stack.push(i)
    }
    
    for i in 0..<count {
        let popRet = stack.pop()
        assert(popRet == (4 - i))
    }
}

testStackBackedWithQueue()
print("testStackBackedWithQueue")
