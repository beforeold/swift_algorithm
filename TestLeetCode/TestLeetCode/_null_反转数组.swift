//
//  _null_反转数组.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

class Solution_null_01 {
  class Solution {
    func reverseArray(_ array: inout [Int]) {
      let mid = array.count >> 1
      for i in 0..<mid {
        (array[i], array[array.count - 1 - i]) = (array[array.count - 1 - i], array[i])
      }
    }
  }
  
  static func test() {
    let solution = Solution()
    var a1 = [1, 2, 3, 4]
    solution.reverseArray(&a1)
    assert(a1 == [4, 3, 2, 1])
    
    var a2 = [1, 2, 3, 4, 5]
    solution.reverseArray(&a2)
    assert(a2 == [5, 4, 3, 2, 1])
    
    var a3 = [1]
    solution.reverseArray(&a3)
    assert(a3 == [1])
    
    var a4 = [Int]()
    solution.reverseArray(&a4)
    assert(a4 == [])
  }
}
