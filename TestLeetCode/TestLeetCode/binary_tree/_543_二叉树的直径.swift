//
//  _543_二叉树的直径.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

// https://leetcode.cn/problems/diameter-of-binary-tree/

class Solution543 {
}

/// 高度：从根结点到最远的叶子结点
/// 直径：任意两个结点之间的最长路径（可能不经过根结点）

extension Solution543 {
  class S1 {
    class Solution {
      var diameter = 0
      
      func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        diameter = 0
        _ = height(of: root)
        return diameter
      }
      
      private func height(of root: TreeNode?) -> Int {
        guard let root = root else {
          return 0
        }
        
        let leftHeight = height(of: root.left)
        let rightHeight = height(of: root.right)
        let curDiameter = leftHeight + rightHeight
        diameter = max(diameter, curDiameter)
        return max(leftHeight, rightHeight) + 1
      }
    }
  }
}


extension Solution543.S1 {
  static func test() {
    let root = TreeNode.create(from: [1, 2, 3])
    let diameter = Solution().diameterOfBinaryTree(root)
    assert(diameter == 2)
  }
}
