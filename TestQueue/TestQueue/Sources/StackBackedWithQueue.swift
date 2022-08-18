//
//  StackBackedWithQueue.swift
//  TestQueue
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation

public class StackBackedWithQueue<E> {
    private var inQueue = Queue<E>()
    private var tempQueue = Queue<E>()
    
    public func push(_ element: E) {
        inQueue.push(element)
    }
    
    public func pop() -> E {
        ensureInQueueEqualOrLessThanOne()
        
        let element = inQueue.pop()
        (inQueue, tempQueue) = (tempQueue, inQueue)
        
        return element
    }
    
    public func peek() -> E? {
        ensureInQueueEqualOrLessThanOne()
        
        return inQueue.peek()
    }
    
    public func size() -> Int {
        return inQueue.size() + tempQueue.size()
    }
    
    public func isEmpty() -> Bool {
        return size() == 0
    }
    
    public func clear() {
        inQueue.clear()
        tempQueue.clear()
    }
    
    private func ensureInQueueEqualOrLessThanOne() {
        let inQueueSize = inQueue.size()
        if inQueueSize <= 1 {
            return
        }
        
        for _ in 0..<(inQueueSize - 1) {
            let element = inQueue.pop()
            tempQueue.push(element)
        }
    }
}
