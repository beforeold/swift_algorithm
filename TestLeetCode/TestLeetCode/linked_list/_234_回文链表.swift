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

extension Solution234 {
  class S3 {
    /// 为保证 O(1) 的空间复杂度和 O(n) 的时间复杂度，采用后半部链表反转对比的方案
    /// // 查找到中点元素
    /// 反转后半部分链表
    /// 对比两个链表
    /// 恢复链表
    class Solution {
      func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        if head?.next == nil {
          return true
        }
        
        let (mid, isEven) = midNode(head)
        let toBeReversed = isEven ? mid : mid?.next
        let reversedRet = reverseList(toBeReversed)
        
        var reversedNode = reversedRet
        
        defer {
          // 恢复链表
          _ = reverseList(reversedRet)
        }
        
        var node = head
        while reversedNode != nil {
          if reversedNode?.val != node?.val {
            return false
          }
          reversedNode = reversedNode?.next
          node = node?.next
        }
        
        return true
      }
      
      func midNode(_ head: ListNode?) -> (mid: ListNode?, isEven: Bool) {
        if head?.next == nil {
          return (head, false)
        }
        
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
          slow = slow?.next
          fast = fast?.next?.next
        }
        
        let isEven = fast == nil
        
        return (slow, isEven)
      }
      
      /// 传入结点，反转链表
      func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
          return head
        }
        
        var newHead: ListNode?
        var head = head
        while head != nil {
          let nextHead = head?.next
          head?.next = newHead
          newHead = head
          head = nextHead
        }
        
        return newHead
      }
    }
    
    static func testMidNode() {
      do {
        let list = ListNode.create(from: [1, 2, 3])
        let ret = Solution().midNode(list)
        print("find mid \(ret.mid?.val as Any)")
      }
      
      do {
        let list = ListNode.create(from: [1, 2, 3, 4])
        let ret = Solution().midNode(list)
        print("find mid \(ret.mid?.val as Any)")
      }
    }
    
    static func test() {
      testMidNode()
      
      do {
        let list = ListNode.create(from: [1, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2, 2, 1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1])
        assert(Solution().isPalindrome(list))
      }
      
      do {
        let list = ListNode.create(from: [1, 2])
        assert(Solution().isPalindrome(list) == false)
      }
    }
  }
}
