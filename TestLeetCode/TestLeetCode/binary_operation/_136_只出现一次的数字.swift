//
//  _136_只出现一次的数字.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/single-number/

class Solution136 {
  
}


extension Solution136 {
  class S1 {
    class Solution {
      func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        
        for x in nums {
          let count = (map[x] ?? 0) + 1
          map[x] = count
        }
        
        for (x, count) in map {
          if count == 1 {
            return x
          }
        }
        
        return -1
      }
    }
  }
}

extension Solution136 {
  class S2 {
    class Solution {
      func singleNumber(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
      }
    }
  }
}

extension Solution136 {
  class S3 {
    class Solution {
      func singleNumber(_ nums: [Int]) -> Int {
        var ret = 0
        for x in nums {
          ret ^= x
        }
        return ret
      }
    }
  }
}
