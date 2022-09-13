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


extension Solution53 {
  class S2 {
    class Solution {
      /// 参考解释
      /// https://leetcode.cn/problems/maximum-subarray/solution/53zui-da-zi-xu-he-swift-by-cobbly/
      func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0}
        
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var curMax = nums[0]
        
        for i in 1..<nums.count {
          let cur = nums[i] + max(dp[i - 1], 0)
          dp[i] = cur
          curMax = max(cur, curMax)
        }
        
        return curMax
      }
    }
  }
}

extension Solution53.S2 {
  static func test() {
    let list = [1, 2]
    assert(Solution().maxSubArray(list) == 3)
  }
}



extension Solution53 {
  class S3 {
    class Solution {
      /// 参考解释
      /// https://leetcode.cn/problems/maximum-subarray/solution/53zui-da-zi-xu-he-swift-by-cobbly/
      func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0}
        
        var allMax = nums[0]
        var dp = nums[0]
        
        for i in 1..<nums.count {
          dp =  nums[i] + max(dp, 0)
          allMax = max(dp, allMax)
        }
        
        return allMax
      }
    }
  }
}

extension Solution53.S3 {
  static func test() {
    let list = [1, 2]
    assert(Solution().maxSubArray(list) == 3)
  }
}
