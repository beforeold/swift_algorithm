//
//  _226_翻转二叉树.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/invert-binary-tree/

class Solution226 {
  
}


extension Solution226 {
  class S1 {
    class Solution {
      func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        
        return root
      }
    }
  }
}
