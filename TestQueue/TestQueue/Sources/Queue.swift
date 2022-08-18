//
//  Queue.swift
//  TestQueue
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

public class Queue<E> {
    private var elements = [E]()
    
    public func push(_ element: E) {
        elements.append(element)
    }
    
    public func pop() -> E {
        return elements.removeFirst()
    }
    
    public func peek() -> E? {
        return elements.first
    }
    
    public func size() -> Int {
        return elements.count
    }
    
    public func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    public func clear() {
        elements = []
    }
}
