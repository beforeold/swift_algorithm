//
//  _102_二叉树的层序遍历.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

// https://leetcode.cn/problems/binary-tree-level-order-traversal/

class Solution102 {
  /// 二级数组层序遍历
  class S1 {
    static func test() {
      let list = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      print("层序遍历结果（二维数组）：", Solution().levelOrder(list))
    }
    
    class Solution {
      func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
          return []
        }
        
        var result = [[Int]]()
        
        // enqueue
        var queue = [TreeNode]()
        queue.append(root)
        
        var leftCount = 1
        var levelValues = [Int]()
        
        while !queue.isEmpty {
          // pop
          let node = queue.removeFirst()
          leftCount -= 1
          
          levelValues.append(node.val)
          
          if let left = node.left {
            queue.append(left)
          }
          
          if let right = node.right {
            queue.append(right)
          }
          
          if leftCount == 0 {
            leftCount = queue.count
            result.append(levelValues)
            levelValues = []
          }
        }
        
        return result
      }
    }
  }
}

extension Solution102 {
  /// 一级数组层序遍历
  class S2 {
    static func test() {
      let list = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      print("层序遍历结果（一维数组）：", Solution().levelOrder(list))
    }
    
    class Solution {
      func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
          return []
        }
        
        var result = [Int]()
        
        // enqueue
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
          // pop
          let node = queue.removeFirst()
          result.append(node.val)
          node.left.map { queue.append($0) }
          node.right.map { queue.append($0) }
        }
        
        return result
      }
    }
  }
}

