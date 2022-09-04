//
//  TreeNode.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

extension TreeNode {
  static func create(from array: [Int]) -> TreeNode? {
    var levelSize = 1
    var index = 0
    var allNodeList = [TreeNode]()
    var prevLevelNodeList = [TreeNode]()
    var curLevelNodeList = [TreeNode]()
    
  outerLoop: while true {
    curLevelNodeList = []
  innerLoop: for _ in 0..<levelSize {
      guard index < array.count else {
        break innerLoop
      }
      
      let node = TreeNode(array[index])
      allNodeList.append(node)
      curLevelNodeList.append(node)
      index += 1
    }
    var curIndex = 0
    for prevNode in prevLevelNodeList {
      if curIndex < curLevelNodeList.count {
        prevNode.left = curLevelNodeList[curIndex]
        curIndex += 1
      } else {
        break outerLoop
      }
      
      if curIndex < curLevelNodeList.count {
        prevNode.right = curLevelNodeList[curIndex]
        curIndex += 1
      } else {
        curIndex += 1
      }
    }
    prevLevelNodeList = curLevelNodeList
    levelSize *= 2
  }
    
    return allNodeList.first
  }
}

extension TreeNode: CustomStringConvertible {
  public var description: String {
    return "\(val) (\(self.left?.val ?? 0) ~ \(self.right?.val ?? 0))"
  }
}
