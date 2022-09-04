//
//  _104_二叉树的最大深度.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/maximum-depth-of-binary-tree/

class Solution104 {
  class S1 {
    class Solution {
      func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        let maxOne = max(maxDepth(root.left), maxDepth(root.right))
        return maxOne + 1
      }
    }
  }
}

extension Solution104 {
  class S2 {
    class Solution {
      func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var depth = 0
        
        while !queue.isEmpty {
          var levelSize = queue.count
          while (levelSize > 0) {
            let popped = queue.removeFirst()
            levelSize -= 1
            
            if let left = popped.left {
              queue.append(left)
            }
            
            if let right = popped.right {
              queue.append(right)
            }
          }
          depth += 1
        }
        
        return depth
      }
    }
  }
}

extension Solution104.S1 {
  static func test() {
    do {
      let root = TreeNode.create(from: [1])
      assert(Solution().maxDepth(root) == 1)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2])
      assert(Solution().maxDepth(root) == 2)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3])
      assert(Solution().maxDepth(root) == 2)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4])
      assert(Solution().maxDepth(root) == 3)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5])
      assert(Solution().maxDepth(root) == 3)
    }
  }
}

extension Solution104.S2 {
  static func test() {
    do {
      let root = TreeNode.create(from: [1])
      assert(Solution().maxDepth(root) == 1)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2])
      assert(Solution().maxDepth(root) == 2)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3])
      assert(Solution().maxDepth(root) == 2)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4])
      assert(Solution().maxDepth(root) == 3)
    }
    
    do {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5])
      assert(Solution().maxDepth(root) == 3)
    }
  }
}
