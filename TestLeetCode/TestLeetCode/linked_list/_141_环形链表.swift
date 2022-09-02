//
//  _141_环形链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

/// https://leetcode.cn/problems/linked-list-cycle/
class Solution141 {
  class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
      guard head?.next != nil else {
        return false
      }
      
      var slow = head
      var fast = head?.next
      while fast != nil && fast?.next != nil {
        
        if fast === slow {
          return true
        }
        
        slow = slow?.next
        fast = fast?.next?.next
      }
      
      return false
    }
  }
}
