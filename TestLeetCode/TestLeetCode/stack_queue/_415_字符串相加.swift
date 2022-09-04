//
//  _415_字符串相加.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/add-strings/

class Solution415 {
  
}

extension Solution415 {
  class S1 {
    class Solution {
      func addStrings(_ num1: String, _ num2: String) -> String {
        let maxCount = max(num1.count, num2.count) + 1
        let list1 = toList(string: num1, count: maxCount)
        let list2 = toList(string: num2, count: maxCount)
        
        var tempResult = [Int](repeating: 0, count: maxCount)
        
        for index in (0..<maxCount).reversed() {
          let sum = list1[index] + list2[index] + tempResult[index]
          if sum < 10 {
            tempResult[index] = sum
          } else {
            tempResult[index] = sum - 10
            tempResult[index - 1] = 1
          }
        }
        
        var string = ""
        for num in tempResult {
          if string.count == 0 {
            if num != 0 {
              string += num.description
            }
          } else {
            string += num.description
          }
        }
        
        return string.count > 0 ? string : "0"
      }
      
      func toList(string: String, count: Int) -> [Int] {
        let left = count - string.count
        let zeros = [Int](repeating: 0, count: left)
        return zeros + string.map { $0.wholeNumberValue! }
      }
    }
  }
}

extension Solution415.S1 {
  static func test() {
    do {
      let ret = Solution().addStrings("123", "45678910")
      assert(ret == (123 + 45678910).description)
    }
    
    do {
      let ret = Solution().addStrings("456", "77")
      assert(ret == (456 + 77).description)
    }
  }
}
