//
//  Solution.swift
//  TestBinarySearchTree
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation

public class Solution {
  /// 递归法
  public static func height(of node: TreeNode?) -> Int {
    guard let node = node else {
      return 0
    }
    
    return 1 + max(height(of: node.left), height(of: node.right))
  }
  
  /// 迭代
  public static func height2(of node: TreeNode?) -> Int {
    guard let node = node else {
      return 0
    }
    
    var levelSize = 1
    var height = 0
    let queue = Queue<TreeNode>()
    queue.push(node)
    
    while !queue.isEmpty() {
      levelSize -= 1
      
      let node = queue.pop()
      node.left.map(queue.push)
      node.right.map(queue.push)
      
      if levelSize == 0 {
        height += 1
        levelSize = queue.size()
      }
    }
    
    return height
  }
  
  /// 判断一棵树是否为完全二叉树
  public static func isCompleteTree(_ node: TreeNode?) -> Bool {
    guard let node = node else {
      return false
    }
    
    let queue = Queue<TreeNode>()
    queue.push(node)
    
    var onlyLeaf = false
    
    while (!queue.isEmpty()) {
      let node = queue.pop()
      
      if onlyLeaf && !node.isLeaf {
        return false
      }
      
      if let left = node.left {
        queue.push(left)
      }
      else {
        if node.right != nil {
          return false
        }
      }
      
      if let right = node.right {
        queue.push(right)
      }
      else {
        onlyLeaf = true
      }
    }
    
    return true
  }
}
