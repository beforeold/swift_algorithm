//
//  _110_平衡二叉树.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/balanced-binary-tree/submissions/

class Solution110 {
}

extension Solution110 {
  class S1 {
    class Solution {
      func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        
        let diff = abs(height(of: root?.left) - height(of: root?.right))
        return diff <= 1 && isBalanced(root?.left) && isBalanced(root?.right)
      }
      
      func height(of node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let left = height(of: node.left)
        let right = height(of: node.right)
        return max(left, right) + 1
      }
    }
  }
}

extension Solution110 {
  class S2 {
    class Solution {
      let failFlag = -1
      func isBalanced(_ root: TreeNode?) -> Bool {
        return height(of: root) >= 0
      }
      
      func height(of node: TreeNode?) -> Int {
        if node == nil { return 0 }
        
        let left = height(of: node?.left)
        if left == failFlag {
          return failFlag
        }
        
        let right = height(of: node?.right)
        if right == failFlag || abs(left - right) > 1 {
          return failFlag
        }
        
        return max(left, right) + 1
      }
    }
  }
}


extension Solution110.S1 {
  static func test() {
    do {
      let root = TreeNode.create(from: [1])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5])
      assert(Solution().isBalanced(root) == true)
    }
  }
}

extension Solution110.S2 {
  static func test() {
    do {
      let root = TreeNode.create(from: [1])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4])
      assert(Solution().isBalanced(root) == true)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5])
      assert(Solution().isBalanced(root) == true)
    }
  }
}
