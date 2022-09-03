//
//  _剑指Offer_54_二叉搜索树的第k大节点.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

// https://leetcode.cn/problems/er-cha-sou-suo-shu-de-di-kda-jie-dian-lcof/

class SolutionOffer54 {
  class S1 {
    class Solution {
      func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
          return -1
        }
        
        var node = root
        var stack = [TreeNode]()
        var result = [Int]()
        
        while node != nil || !stack.isEmpty {
          while node != nil {
            stack.append(node!)
            node = node?.right
          }
          node = stack.removeLast()
          result.append(node!.val)
          node = node?.left
        }
        
        let kIndex = k - 1
        if (0..<result.count).contains(kIndex) {
          return result[kIndex]
        }
        return -1
      }
    }
  }
}

extension SolutionOffer54 {
  class S2 {
    class Solution {
      func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
          return -1
        }
        
        var node = root
        var stack = [TreeNode]()
        var k = k
        
        while node != nil || !stack.isEmpty {
          while node != nil {
            stack.append(node!)
            node = node?.right
          }
          
          node = stack.removeLast()
          k -= 1
          if k == 0 {
            return node!.val
          }
          
          node = node?.left
        }
        
        return -1
      }
    }
  }
}
