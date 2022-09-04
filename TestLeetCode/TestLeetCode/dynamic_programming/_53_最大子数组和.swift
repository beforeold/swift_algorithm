//
//  _53_最大子数组和.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/maximum-subarray/

class Solution53 {
  
}

extension Solution53 {
  class S1 {
    class Solution {
      func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0
        var maxValue = nums[0]
        for x in nums {
          let cur = max(pre, pre + x)
          maxValue = max(maxValue, cur)
          pre = cur
        }
        
        return 0
      }
    }
  }
}
