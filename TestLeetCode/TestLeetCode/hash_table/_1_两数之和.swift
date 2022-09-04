//
//  _1_两数之和.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/two-sum/

class Solution1 {
  
}

extension Solution1 {
  class S1 {
    class Solution {
      func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
          if let preIndex = map[target - num] {
            return [preIndex, index]
          } else {
            map[num] = index
          }
        }
        
        return [-1, -1]
      }
    }
  }
}
