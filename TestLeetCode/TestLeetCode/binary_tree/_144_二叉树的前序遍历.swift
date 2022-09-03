//
//  _144_二叉树的前序遍历.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

// https://leetcode.cn/problems/binary-tree-preorder-traversal/

class Solution144 {
  class S1 {
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
  class S2 {
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
