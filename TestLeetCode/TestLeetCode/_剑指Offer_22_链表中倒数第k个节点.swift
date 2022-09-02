//
//  _剑指Offer_22_链表中倒数第k个节点.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
class SolutionOffer22 {
  class S1 {
    class Solution {
      func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var slow = head
        var fast = head
        
        for _ in 0..<k {
          if fast == nil {
            return nil
          }
          fast = fast?.next
        }
        
        while fast != nil {
          slow = slow?.next
          fast = fast?.next
        }
        
        return slow
      }
    }
    
    static func test() {
      do {
        let list = ListNode.create(from: [3, 2, 1])
        assert(Solution().getKthFromEnd(list, 1)?.val == 1)
      }
      
      do {
        let list = ListNode.create(from: [3, 2, 1])
        assert(Solution().getKthFromEnd(list, 10)?.val == nil)
      }
      
      do {
        let list = ListNode.create(from: [1])
        assert(Solution().getKthFromEnd(list, 1)?.val == 1)
      }
    }
  }
}

extension SolutionOffer22 {
  class S2 {
    /*
     可以解决问题，不过对于 k 较大时的边界条件的判断会无效
     */
    
    /*
     作者：silence95
     链接：https://leetcode.cn/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/solution/swiftkuai-man-zhi-zhen-by-silence95-c1ce/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    class Solution {
      func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
          return nil
        }
        
        var tk = k
        
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while tk > 0 {
          fast = fast?.next
          tk -= 1
        }
        
        while fast != nil {
          fast = fast?.next
          slow = slow?.next
        }
        return slow
      }
    }
    
    static func test() {
      do {
        let list = ListNode.create(from: [3, 2, 1])
        assert(Solution().getKthFromEnd(list, 1)?.val == 1)
      }
      
      do {
        let list = ListNode.create(from: [3, 2, 1])
        assert(Solution().getKthFromEnd(list, 10)?.val == nil)
      }
      
      do {
        let list = ListNode.create(from: [1])
        assert(Solution().getKthFromEnd(list, 1)?.val == 1)
      }
    }
  }
}
