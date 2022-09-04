//
//  _704_二分查找.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/binary-search/

class Solution704 {
  
}

extension Solution704 {
  class S1 {
    class Solution {
      func search(_ nums: [Int], _ target: Int) -> Int {
        for i in 0..<nums.count {
          if nums[i] == target {
            return i
          }
        }
        return -1
      }
    }
  }
}

extension Solution704 {
  class S2 {
    class Solution {
      func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        return search(nums, target, begin: 0, end: nums.count - 1)
      }
      
      private func search(_ nums: [Int], _ target: Int, begin: Int, end: Int) -> Int {
        if end < begin { return -1 }
        
        if begin == end {
          return nums[begin] == target ? begin : -1
        }
        
        let midIndex = (begin + end) / 2
        let midValue = nums[midIndex]
        if target > midValue {
          return search(nums, target, begin: midIndex + 1, end: end)
        } else if target < midValue {
          return search(nums, target, begin: begin, end: midIndex - 1)
        } else {
          return midIndex
        }
      }
    }
  }
}

extension Solution704.S2 {
  static func test() {
    let ret = Solution().search([2, 5], 0)
    assert(ret == -1)
  }
}

