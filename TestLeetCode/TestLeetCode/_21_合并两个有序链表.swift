//
//  _21_合并两个有序链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/merge-two-sorted-lists/
class Solution21 {
  /// 双指针构建一个新的链表
  class S1 {
    class Solution {
      func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var curNode: ListNode? = dummyHead
        var p1 = list1
        var p2 = list2
        
        while p1 != nil || p2 != nil {
          if let p1node = p1, let p2node = p2 {
            if p1node.val < p2node.val {
              p1 = p1?.next
              curNode?.next = p1node
              curNode = p1node
            } else {
              p2 = p2?.next
              curNode?.next = p2node
              curNode = p2node
            }
          }
          else if p1 != nil {
            curNode?.next = p1
            break
          }
          else {
            curNode?.next = p2
            break
          }
        }
        
        return dummyHead.next
      }
    }
    
    static func test() {
      let list1 = ListNode.create(from: [1, 2, 5])
      let list2 = ListNode.create(from: [2, 3, 4, 6])
      let merged = Solution().mergeTwoLists(list1, list2)
      assert(ListNode.printableListString(of: merged) == "[1, 2, 2, 3, 4, 5, 6]")
    }
  }
}

extension Solution21 {
  /// 对第一个写法进行优化
  class S2 {
    class Solution {
      func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)
        var curNode: ListNode? = dummyHead
        
        var list1 = list1
        var list2 = list2
        
        while list1 != nil && list2 != nil {
          if list1!.val < list2!.val {
            curNode?.next = list1
            list1 = list1?.next
          } else {
            curNode?.next = list2
            list2 = list2?.next
          }
          curNode = curNode?.next
        }
        
        curNode?.next = list1 ?? list2
        
        return dummyHead.next
      }
    }
    
    static func test() {
      let list1 = ListNode.create(from: [1, 2, 5])
      let list2 = ListNode.create(from: [2, 3, 4, 6])
      let merged = Solution().mergeTwoLists(list1, list2)
      assert(ListNode.printableListString(of: merged) == "[1, 2, 2, 3, 4, 5, 6]")
    }
  }
}

extension Solution21 {
  /// 递归
  class S3 {
    class Solution {
      func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
          return list2
        } else if list2 == nil {
          return list1
        } else if list1!.val < list2!.val {
          list1?.next = mergeTwoLists(list1?.next, list2)
          return list1
        } else {
          list2?.next = mergeTwoLists(list1, list2?.next)
          return list2
        }
      }
    }
    
    static func test() {
      do {
        let list1 = ListNode.create(from: [1, 2, 5])
        let list2 = ListNode.create(from: [2, 3, 4, 6])
        let merged = Solution().mergeTwoLists(list1, list2)
        assert(ListNode.printableListString(of: merged) == "[1, 2, 2, 3, 4, 5, 6]")
      }
      
      do {
        let list1 = ListNode.create(from: [5])
        let list2 = ListNode.create(from: [1, 2, 4])
        let merged = Solution().mergeTwoLists(list1, list2)
        assert(ListNode.printableListString(of: merged) == "[1, 2, 4, 5]")
      }
    }
  }
}
