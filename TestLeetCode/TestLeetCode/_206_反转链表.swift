//
//  _206_反转链表.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/reverse-linked-list/

class Solution206 {
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
    func reverseList(_ head: ListNode?) -> ListNode? {
      nil
    }
  }
  
  /// 递归
  class Solution02 {
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
    let list = ListNode.create(from: [1, 2, 3, 4, 5])
    print(ListNode.printableListString(of: list))
    let new = Solution02().reverseList(list)
    print(ListNode.printableListString(of: new))
  }
}
