//
//  Browser.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation

public class Browser {
    private let inStack = Stack<String>()
    private let tempStack = Stack<String>()
    
    public func peak() -> String? {
        return inStack.peek()
    }
    
    public func push(_ val: String) {
        inStack.push(val)
        tempStack.clear()
    }
    
    public func pop() {
        let string = inStack.pop()
        tempStack.push(string)
    }
    
    public func forward() {
        let string = tempStack.pop()
        inStack.push(string)
    }
}

extension Browser: CustomStringConvertible {
    public var description: String {
        return "inStack: \(inStack), tempStack: \(tempStack)"
    }
}
