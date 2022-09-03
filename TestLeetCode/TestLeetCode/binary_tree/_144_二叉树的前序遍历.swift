//
//  _144_二叉树的前序遍历.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/binary-tree-preorder-traversal/

class Solution144 {
  /// 递归实现
  class S1 {
    static func test() {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      let ret = Solution().preorderTraversal(root)
      assert(ret == [1, 2, 4, 5, 3, 6, 7])
    }
    
    class Solution {
      func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
          return []
        }
        
        var array = [root.val]
        array.append(contentsOf: preorderTraversal(root.left))
        array.append(contentsOf: preorderTraversal(root.right))
        
        return array
      }
    }
  }
}

extension Solution144 {
  /// 使用 stack 进行迭代实现
  class S2 {
    static func test() {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      let ret = Solution().preorderTraversal(root)
      assert(ret == [1, 2, 4, 5, 3, 6, 7])
    }
    
    class Solution {
      func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result = [Int]()
        
        var stack = [TreeNode]()
        stack.append(root)
        
        while !stack.isEmpty {
          let popped = stack.removeLast()
          result.append(popped.val)
          
          if let right = popped.right {
            stack.append(right)
          }
          
          if let left = popped.left {
            stack.append(left)
          }
        }
        
        return result
      }
    }
  }
}

extension Solution144 {
  class S3 {
    class Solution {
      func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
          return []
        }
        
        var array = [root.val]
        array.append(contentsOf: preorderTraversal(root.left))
        array.append(contentsOf: preorderTraversal(root.right))
        
        return array
      }
    }
  }
}
