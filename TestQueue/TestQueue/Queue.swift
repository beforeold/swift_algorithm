//
//  Queue.swift
//  TestQueue
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

class Queue<E> {
    private var elements = [E]()
    
    func push(_ element: E) {
        elements.append(element)
    }
    
    func pop() -> E {
        return elements.removeFirst()
    }
    
    func peek() -> E? {
        return elements.first
    }
    
    func size() -> Int {
        return elements.count
    }
}
