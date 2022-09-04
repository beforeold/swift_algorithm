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

extension Solution112 {
  class S2 {
    class Solution {
      func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        var queue = [TreeNode]()
        queue.append(root)
        
        var sumQueue = [Int]()
        sumQueue.append(root.val)
        
        
        while !queue.isEmpty {
          let popped = queue.removeFirst()
          let curSum = sumQueue.removeFirst()
          
          if popped.left == nil && popped.right == nil {
            if curSum == targetSum {
              return true
            } else {
              continue
            }
          }
          if let left = popped.left {
            queue.append(left)
            sumQueue.append(curSum + left.val)
          }
          if let right = popped.right {
            queue.append(right)
            sumQueue.append(curSum + right.val)
          }
        }
        return false
      }
    }
  }
}
