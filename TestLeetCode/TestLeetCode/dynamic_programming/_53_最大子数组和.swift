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
      /// 参考解释
      /// https://leetcode.cn/problems/maximum-subarray/solution/53zui-da-zi-xu-he-swift-by-cobbly/
      func maxSubArray(_ nums: [Int]) -> Int {
        var pre = 0
        var maxValue = nums[0]
        
        for x in nums {
          let curSum = max(x, pre + x)
          maxValue = max(maxValue, curSum)
          // print("pre: \(pre), x: \(x), curSum: \(curSum), maxValue: \(maxValue)")
          pre = curSum
        }
        
        return maxValue
      }
    }
  }
}

extension Solution53.S1 {
  static func test() {
    let list = [1, 2]
    assert(Solution().maxSubArray(list) == 3)
  }
}
