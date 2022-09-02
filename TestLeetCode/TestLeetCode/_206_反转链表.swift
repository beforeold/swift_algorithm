//
//  _206_反转链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/reverse-linked-list/
public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  
  static func create(from array: [Int]) -> ListNode? {
    let dummyHead = ListNode(0)
    
    var node: ListNode? = dummyHead
    for element in array {
      let new = ListNode(element)
      node?.next = new
      node = new
    }
    
    return dummyHead.next
  }
  
  static func printableListString(of node: ListNode?) -> String {
    var node = node
    if node == nil {
      return "null"
    }
    var string = "["
    while node != nil {
      let next = node?.next
      
      let nodeValue = node!.val
      if next == nil {
        string += "\(nodeValue)"
      } else {
        string += "\(nodeValue), "
      }
      
      node = next
    }
    string += "]"
    
    return string
  }
}

extension Optional where Wrapped: ListNode {
  func toString() -> String {
    return ListNode.printableListString(of: self)
  }
}

class Solution206 {
  
  
  /**
   * Definition for singly-linked list.
   * public class ListNode {
   *     public var val: Int
   *     public var next: ListNode?
   *     public init() { self.val = 0; self.next = nil; }
   *     public init(_ val: Int) { self.val = val; self.next = nil; }
   *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
   * }
   */
  class Solution {
    // 手动构建一条新链表
    func reverseList(_ head: ListNode?) -> ListNode? {
      var head = head
      if head?.next == nil {
        return head
      }
      
      var newHead: ListNode? = nil
      while head != nil {
        // 1、找个 head（A），保存下一个 head（B：A->next）
        // 2、将 A 作为 new head
        let curHead = head
        head = curHead?.next
        curHead?.next = newHead
        newHead = curHead
      }
      
      return newHead
    }
    
    func _reverseList(_ head: ListNode?) -> ListNode? {
      var head = head
      if head?.next == nil {
        return head
      }
      
      var newHead: ListNode? = nil
      while head != nil {
        // 1、找个 head（A），保存下一个 head（B：A->next）
        // 2、将 A 作为 new head
        let nextHead = head?.next
        head?.next = newHead
        newHead = head
        head = nextHead
      }
      
      return newHead
    }
  }
  
  static func test() {
    let list = ListNode.create(from: [5, 4, 3, 2, 1])
    let new = Solution().reverseList(list)
    assert(ListNode.printableListString(of: new) == "[1, 2, 3, 4, 5]")
  }
}

extension Solution206 {
  class S2 {
    /// 递归
    class Solution {
      func reverseList(_ head: ListNode?) -> ListNode? {
        guard let _ = head?.next else {
          return head
        }
        
        let ret = reverseList(head?.next)
        let tail = head?.next
        tail?.next = head
        head?.next = nil
        
        return ret
      }
    }
    
    static func test() {
      let list = ListNode.create(from: [5, 4, 3, 2, 1])
      let new = Solution().reverseList(list)
      assert(ListNode.printableListString(of: new) == "[1, 2, 3, 4, 5]")
    }
  }
}
