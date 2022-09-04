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
        if n < 3 { return n }
        
        let n_1 = climbStairs(n - 1);
        let n_2 = climbStairs(n - 2);
        return n_1 + n_2
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
