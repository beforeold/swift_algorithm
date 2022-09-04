//
//  _69_x的平方根.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/sqrtx/

class Solution69 {
  
}

extension Solution69 {
  class S1 {
    class Solution {
      func mySqrt(_ x: Int) -> Int {
        var left = 0
        var right = x
        var result = -1
        while left <= right {
          let mid = (left + right) / 2
          if mid * mid <= x {
            result = mid
            left = mid + 1
            
          } else {
            right = mid - 1
          }
        }
        
        return result
      }
    }
  }
}
