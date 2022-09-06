//
//  _14_最长公共前缀.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/6.
//

import Foundation


// https://leetcode.cn/problems/longest-common-prefix/

class Solution14 {
  
}

extension Solution14 {
  class S1 {
    class Solution {
      func longestCommonPrefix(_ strs: [String]) -> String {
        let s1 = strs[0]
        
        var commonChars = ""
        
        for (index, char) in s1.enumerated() {
          var isSame = true
          for each in strs {
            let stringIndex = each.index(each.startIndex, offsetBy: index)
            guard stringIndex < each.endIndex else {
              isSame = false
              break
            }
            
            let thisChar = each[stringIndex]
            if thisChar != char {
              isSame = false
              break
            }
          }
          if isSame {
            commonChars.append(char)
          } else {
            break
          }
        }
        
        return commonChars
      }
    }
  }
}

extension Solution14.S1 {
  static func test() {
    do {
      let strings = ["flower","flow","flight"]
      assert(Solution().longestCommonPrefix(strings) == "fl")
    }
    
    do {
      let strings = ["dog","racecar","car"]
      assert(Solution().longestCommonPrefix(strings) == "")
    }
    
    do {
      let strings = ["ab","a"]
      assert(Solution().longestCommonPrefix(strings) == "a")
    }
  }
}
