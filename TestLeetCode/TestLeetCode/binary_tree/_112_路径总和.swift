//
//  _112_路径总和.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/path-sum/

class Solution112 {
  
}

extension Solution112 {
  class S1 {
    class Solution {
      func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.left == nil && root.right == nil {
          return root.val == targetSum
        }
        
        let sub = targetSum - root.val
        return hasPathSum(root.left, sub) || hasPathSum(root.right, sub)
      }
    }
  }
}
