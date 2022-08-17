//
//  Stack.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/17.
//

public class Stack<E> {
    private var elements = [E]()
    
    public func push(_ element: E) {
        elements.append(element)
    }
    
    public func pop() -> E {
        return elements.removeLast()
    }
    
    public func peek() -> E? {
        return elements.last
    }
    
    public func size() -> Int {
        return elements.count
    }
}
