//
//  _83_删除排序链表中的重复元素.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/remove-duplicates-from-sorted-list/
class Solution83 {
  class S1 {
    static func test() {
      do {
        let list = ListNode.create(from: [1, 1, 2, 2, 3, 3])
        let ret = Solution().deleteDuplicates(list)?.toArray()
        assert(ret == [1, 2, 3])
      }
      
      do {
        let list = ListNode.create(from: [1, 1])
        let ret = Solution().deleteDuplicates(list)?.toArray()
        assert(ret == [1])
      }
      
      do {
        let list = ListNode.create(from: [1])
        let ret = Solution().deleteDuplicates(list)?.toArray()
        assert(ret == [1])
      }
    }
    
    class Solution {
      func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0, head)
        
        var node = dummyHead.next
        while node?.next != nil {
          if node?.val == node?.next?.val {
            node?.next = node?.next?.next
          } else {
            node = node?.next
          }
        }
        
        return dummyHead.next
      }
    }
  }
}
