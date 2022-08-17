//
//  main.swift
//  TestQueue
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

let queue = Queue<Int>()

let count = 5
for i in 0..<count {
    queue.push(i)
}

for _ in 0..<count {
    print(queue.pop())
}
