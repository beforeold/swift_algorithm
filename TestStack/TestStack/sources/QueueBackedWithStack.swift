//
//  QueueBackedWithStack.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation


public class QueueBackedWithStack<E> {
    private let inStack = Stack<E>()
    private let outStack = Stack<E>()
    
    public func push(_ element: E) {
        inStack.push(element)
    }
    
    public func pop() -> E {
        ensureOutStack()
        
        return outStack.pop()
    }
    
    public func peek() -> E? {
        ensureOutStack()
        
        return outStack.peek()
    }
    
    public func size() -> Int {
        return inStack.size() + outStack.size()
    }
    
    public func isEmpty() -> Bool {
        return size() == 0
    }
    
    public func clear() {
        inStack.clear()
        outStack.clear()
    }
    
    private func ensureOutStack() {
        if outStack.isEmpty() {
            while !inStack.isEmpty() {
                let element = inStack.pop()
                outStack.push(element)
            }
        }
    }
}
