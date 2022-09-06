//
//  _70_爬楼梯.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/climbing-stairs/

class Solution70 {
  
}

extension Solution70 {
  class S1 {
    class Solution {
      func climbStairs(_ n: Int) -> Int {
        if n <= 3 { return n }
        
        let n_1 = climbStairs(n - 1);
        let n_2 = climbStairs(n - 2);
        return n_1 + n_2
      }
    }
  }
}

extension Solution70 {
  class S2 {
    class Solution {
      func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n {
          dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
      }
    }
  }
}

extension Solution70 {
  class S3 {
    class Solution {
      func climbStairs(_ n: Int) -> Int {
        var p = 0
        var q = 0
        var r = 1
        for _ in 1...n {
          p = q
          q = r
          r = p + q
        }
        return r
      }
    }
  }
}


extension Solution70.S1 {
  static func test() {
    // 111
    // 12
    // 21
    assert(Solution().climbStairs(3) == 3)
    
    // 1111
    // 22
    // 121
    // 112
    // 211
    assert(Solution().climbStairs(4) == 5)
  }
}

extension Solution70.S3 {
  static func test() {
    
    // 111
    // 12
    // 21
    assert(Solution().climbStairs(3) == 3)
    
    // 1111
    // 22
    // 121
    // 112
    // 211
    assert(Solution().climbStairs(4) == 5)
  }
}
