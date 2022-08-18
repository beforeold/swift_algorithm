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
    
    public func isEmpty() -> Bool {
        return elements.count == 0
    }
    
    public func clear() {
        elements = []
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return "top -> \(Array(elements.reversed()))"
    }
}
