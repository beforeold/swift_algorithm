//
//  _155_最小栈.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/min-stack/

class Solution155 {
  
}

extension Solution155 {
  class S1 {
    class MinStack {
      var xstack = [Int]()
      var minStack = [Int]()
      init() {
        minStack.append(Int.max)
      }
      
      func push(_ val: Int) {
        xstack.append(val)
        
        let newMin = min(xstack.last!, val)
        minStack.append(newMin)
      }
      
      func pop() {
        xstack.removeLast()
        minStack.removeLast()
      }
      
      func top() -> Int {
        return xstack.last!
      }
      
      func getMin() -> Int {
        return minStack.last!
      }
    }
  }
}

