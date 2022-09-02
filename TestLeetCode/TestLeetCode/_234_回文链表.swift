//
//  _234_回文链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation
// https://leetcode.cn/problems/palindrome-linked-list/
class Solution234 {
  class S1 {
    /// 利用数组的对称性查找
    class Solution {
      func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
          return false
        }
        
        var node = head
        var array = [Int]()
        while node != nil {
          array.append(node!.val)
          node = node?.next
        }
        
        let mid = array.count >> 1
        for i in 0..<mid {
          if array[i] != array[array.count - 1 - i] {
            return false
          }
        }
        return true
      }
    }
    
    static func test() {
      do {
        let list = ListNode.create(from: [1, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2])
        assert(Solution().isPalindrome(list) == false)
      }
    }
  }
}

extension Solution234 {
  class S2 {
    /// 使用栈达到反转链表的效果
    class Solution {
      func isPalindrome(_ head: ListNode?) -> Bool {
        var stack = [ListNode]()
        
        var node = head
        while node != nil {
          stack.append(node!)
          node = node?.next
        }
        
        node = head
        while node != nil {
          let popped = stack.removeLast()
          if node?.val != popped.val {
            return false
          }
          node = node?.next
        }
        
        return true
      }
    }
    
    static func test() {
      do {
        let list = ListNode.create(from: [1, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2])
        assert(Solution().isPalindrome(list) == false)
      }
    }
  }
}
