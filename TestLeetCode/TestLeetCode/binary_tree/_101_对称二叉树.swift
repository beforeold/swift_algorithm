//
//  _101_对称二叉树.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/symmetric-tree/

class Solution101 {
  
}

extension Solution101 {
  class S1 {
    class Solution {
      func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root?.left, root?.right)
      }
      
      private func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
          return true
        }
        
        if p == nil || q == nil {
          return false
        }
        
        return p?.val == q?.val
        && check(p?.left, q?.right)
        && check(p?.right, q?.left)
      }
    }
  }
}

extension Solution101 {
  class S2 {
    class Solution {
      func isSymmetric(_ root: TreeNode?) -> Bool {
        return check(root?.left, root?.right)
      }
      
      private func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var p = p
        var q = q
        var queue = [TreeNode?]()
        
        queue.append(p)
        queue.append(q)
        
        while !queue.isEmpty {
          p = queue.removeFirst()
          q = queue.removeFirst()
          if p == nil && q == nil {
            continue
          }
          
          guard let p = p, let q = q else {
            return false
          }
          
          guard p.val == q.val else {
            return false
          }
          
          queue.append(p.left)
          queue.append(q.right)
          
          queue.append(p.right)
          queue.append(q.left)
        }
        
        return true
      }
    }
  }
}
