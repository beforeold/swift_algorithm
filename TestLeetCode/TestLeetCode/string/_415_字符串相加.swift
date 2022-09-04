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

extension Solution415 {
  class S2 {
    class Solution {
      func addStrings(_ num1: String, _ num2: String) -> String {
        var index1 = num1.count - 1
        var index2 = num2.count - 1
        var add = 0
        
        let list1 = num1.map { $0.wholeNumberValue! }
        let list2 = num2.map { $0.wholeNumberValue! }
        
        var result = [Int]()
        
        while index1 >= 0 || index2 >= 0 || add > 0 {
          let v1 = int(index: index1, list1)
          let v2 = int(index: index2, list2)
          let sum = v1 + v2 + add
          add = sum / 10
          result.append(sum % 10)
          
          index1 -= 1
          index2 -= 1
        }
        
        result.reverse()
        return result.reduce("") { partialResult, element in
          return partialResult + element.description
        }
      }
      
      func int(index: Int, _ list: [Int]) -> Int {
        return index >= 0 ? list[index] : 0
      }
    }
  }
}

extension Solution415.S2 {
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
