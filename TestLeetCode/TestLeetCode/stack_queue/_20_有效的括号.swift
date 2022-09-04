//
//  _20_有效的括号.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/valid-parentheses/

class Solution20 {
  
}

extension Solution20 {
  class S1 {
    class Solution {
        func isValid(_ s: String) -> Bool {
          let map: [Character: Character] = [
            "(": ")",
            "[": "]",
            "{": "}",
          ]
          
          var stack = [Character]()
          
          for (_, char) in s.enumerated() {
            if let _ = map[char] {
              print(char, char, separator: ", ")
              stack.append(char)
              continue
            }
            
            if stack.isEmpty {
              return false
            }
            
            let popped = stack.removeLast()
            let target = map[popped]
            if target != char {
              return false
            }
          }
          
          return stack.isEmpty
        }
    }
  }
}

extension Solution20.S1 {
  static func test() {
    do {
      let string = "{[()]}"
      assert(Solution().isValid(string))
    }
    
    do {
      let string = "{}("
      assert(Solution().isValid(string) == false)
    }
  }
}
