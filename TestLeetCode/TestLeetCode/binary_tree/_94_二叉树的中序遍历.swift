//
//  _94_二叉树的中序遍历.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/3.
//

import Foundation

// https://leetcode.cn/problems/binary-tree-inorder-traversal/

class Solution94 {
  // 递归
  class S1 {
    static func test() {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      let ret = Solution().inorderTraversal(root)
      assert(ret == [4, 2, 5, 1, 6, 3, 7])
    }
    
    class Solution {
      func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        let left = inorderTraversal(root.left)
        let right = inorderTraversal(root.right)
        return left + [root.val] + right
      }
    }
  }
}

extension Solution94 {
  // 迭代
  class S2 {
    static func test() {
      do {
        let root = TreeNode(1)
        
        let node2 = TreeNode(2)
        root.right = node2
        
        let node3 = TreeNode(3)
        node2.left = node3
        
        let ret = Solution().inorderTraversal(root)
        assert(ret == [1, 3, 2])
      }
      
      do {
        let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
        let ret = Solution().inorderTraversal(root)
        assert(ret == [4, 2, 5, 1, 6, 3, 7])
      }
    }
    
    class Solution {
      func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var stack = [TreeNode]()
        var result = [Int]()
        var node = root
        
        while node != nil || !stack.isEmpty {
          while node != nil {
            stack.append(node!)
            node = node?.left
          }
          node = stack.removeLast()
          result.append(node!.val)
          node = node?.right
        }
        
        return result
      }
    }
  }
}

extension Solution94 {
  // morris
  class S3 {
    class Solution {
      /*
       作者：LeetCode-Solution
       链接：https://leetcode.cn/problems/binary-tree-inorder-traversal/solution/er-cha-shu-de-zhong-xu-bian-li-by-leetcode-solutio/
       来源：力扣（LeetCode）
       著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
       */
      func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var root = root
        var res = [Int]()
        var predecessor: TreeNode? = nil
        
        while (root != nil) {
          if (root?.left != nil) {
            // predecessor 节点就是当前 root 节点向左走一步，然后一直向右走至无法走为止
            predecessor = root?.left;
            while (predecessor?.right != nil && predecessor?.right !== root) {
              predecessor = predecessor?.right;
            }
            
            // 让 predecessor 的右指针指向 root，继续遍历左子树
            if (predecessor?.right == nil) {
              predecessor?.right = root;
              root = root?.left;
            }
            // 说明左子树已经访问完了，我们需要断开链接
            else {
              res.append(root?.val ?? 0);
              predecessor?.right = nil;
              root = root?.right;
            }
          }
          // 如果没有左孩子，则直接访问右孩子
          else {
            res.append(root?.val ?? 0);
            root = root?.right;
          }
        }
        return res;
      }
    }
  }
}

extension Solution94 {
  // 优化 S2
  class S4 {
    static func test() {
      do {
        let root = TreeNode(1)
        
        let node2 = TreeNode(2)
        root.right = node2
        
        let node3 = TreeNode(3)
        node2.left = node3
        
        let ret = Solution().inorderTraversal(root)
        assert(ret == [1, 3, 2])
      }
      
      do {
        let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
        let ret = Solution().inorderTraversal(root)
        assert(ret == [4, 2, 5, 1, 6, 3, 7])
      }
    }
    
    class Solution {
      func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var stack = [TreeNode]()
        var result = [Int]()
        var node = root
        
        while true {
          if node != nil {
            stack.append(node!)
            node = node?.left
          } else {
            if stack.isEmpty {
              return result
            } else {
              node = stack.removeLast()
              result.append(node!.val)
              node = node?.right
            }
          }
        }
        
        return result
      }
    }
  }
}
