//
//  _169_多数元素.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/majority-element/

class Solution169 {
  
}

extension Solution169 {
  class S1 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        
        for num in nums {
          let count = (map[num] ?? 0) + 1
          map[num] = count
        }
        
        var max = (num: -1, count: -1)
        for (num, count) in map {
          if count > max.count {
            max = (num, count)
          }
        }
        
        if max.count > nums.count / 2 {
          return max.num
        }
        return -1
      }
    }
  }
}

extension Solution169 {
  class S2 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        let n = nums.count
        
        for num in nums {
          let count = (map[num] ?? 0) + 1
          if count > n / 2 {
            return num
          }
          
          map[num] = count
        }
        
        return -1
      }
    }
  }
}
