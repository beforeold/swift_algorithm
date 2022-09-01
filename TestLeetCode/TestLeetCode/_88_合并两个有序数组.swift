//
//  _88_合并两个有序数组.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/1.
//

import Foundation

// https://leetcode.cn/problems/merge-sorted-array/solution/
class Solution88 {
  class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
      if m == 0 {
        nums1 = nums2
        return
      }
      
      if n == 0 {
        return
      }
      
      var m = m
      var p1 = 0
      var p2 = 0
      
      while (m > p1 && n > p2) {
        let v1 = nums1[p1]
        let v2 = nums2[p2]
        print("p1: \(p1)~ \(v1), p2: \(p2)~\(v2)")
        
        if v2 < v1 {
          // insert here
          nums1.insert(v2, at: p1)
          p1 += 1
          p2 += 1
          m += 1
          // remove last zero
          nums1.removeLast()
        } else {
          // search next position for inserting
          p1 += 1
        }
      }
      
      // move left elements
      for i in p2..<n {
        let value = nums2[i]
        nums1[p1] = value
        p1 += 1
      }
    }
  }
  
  static func test() {
    var nums1 = [3, 6, 8]
    let m = nums1.count
    let nums2 = [4, 5, 10, 11]
    let n = nums2.count;

    // add zero
    nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))

    Solution88.Solution().merge(&nums1, m, nums2, n)
    assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
  }
}

