//
//  ListNode.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation


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
  
  func toArray() -> [Int] {
    var array = [Int]()
    
    var node: ListNode? = self
    while node != nil {
      array.append(node!.val)
      node = node?.next
    }
    
    return array
  }
  
  static func printableListString(of node: ListNode?) -> String {
    guard let node = node else {
      return "null";
    }
    return node.toArray().description
  }
}

extension Optional where Wrapped: ListNode {
  func toString() -> String {
    return ListNode.printableListString(of: self)
  }
}
