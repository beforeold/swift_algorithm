//
//  _232_用栈实现队列.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/implement-queue-using-stacks/

class Solution232 {
  
}

extension Solution232 {
  class S1 {
    class MyQueue {
      var inStack = [Int]()
      var outStack = [Int]()
      
      init() {
        
      }
      
      func push(_ x: Int) {
        inStack.append(x)
      }
      
      func pop() -> Int {
        ensureOutStack()
        return outStack.removeLast()
      }
      
      func peek() -> Int {
        ensureOutStack()
        return outStack.last!
      }
      
      func empty() -> Bool {
        return inStack.isEmpty && outStack.isEmpty
      }
      
      func ensureOutStack() {
        if outStack.isEmpty {
          while !inStack.isEmpty {
            outStack.append(inStack.removeLast())
          }
        }
      }
    }
  }
}
