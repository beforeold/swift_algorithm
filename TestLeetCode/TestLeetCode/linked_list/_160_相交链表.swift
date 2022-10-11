//
//  _160_相交链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/intersection-of-two-linked-lists/

class Solution160 {
  class S1 {
    // 先对齐两个链表，再逐个对比
    class Solution {
      func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        // calculate count
        let count1 = count(of: headA)
        let count2 = count(of: headB)
        
        // align two list
        var headA = headA
        var headB = headB
        if count1 > count2 {
          headA = proceed(headA, stepCount: count1 - count2)
        } else if count1 < count2 {
          headB = proceed(headB, stepCount: count2 - count1)
        }
        
        // go to check
        while headA != nil && headB != nil {
          if headA === headB {
            return headB
          }
          
          headA = headA?.next
          headB = headB?.next
        }
        
        return nil
      }
      
      func proceed(_ head: ListNode?, stepCount: Int) -> ListNode? {
        var head = head
        for _ in 0..<stepCount {
          head = head?.next
        }
        return head
      }
      
      func count(of head: ListNode?) -> Int {
        var count = 0
        var node = head
        while node != nil {
          node = node?.next
          count += 1
        }
        return count
      }
    }
  }
}

extension Solution160 {
  class S2 {
    /// 利用 hashset 进行去重
    class Solution {
      struct NodeWrapper: Hashable {
        var node: ListNode
        static func == (lhs: NodeWrapper, rhs: NodeWrapper) -> Bool {
          return lhs.node === rhs.node
        }
        
        func hash(into hasher: inout Hasher) {
          hasher.combine(ObjectIdentifier(self.node))
        }
      }
      
      func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var set: Set<NodeWrapper> = []
        var node = headA
        while node != nil {
          set.insert(NodeWrapper(node: node!))
        }
        
        node = headB
        while node != nil {
          if set.contains(NodeWrapper(node: node!)) {
            return node
          }
        }
        
        return nil
      }
    }
  }
}


extension Solution160 {
  class S3 {
    /// 利用 hashset 进行去重
    class Solution {
      func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
          return nil
        }
        
        var pA = headA
        var pB = headB
        while pA !== pB {
          pA = pA == nil ? headB : pA?.next
          pB = pB == nil ? headA : pB?.next
        }
        return pA
      }
    }
  }
}
