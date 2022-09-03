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
  /// Morris 遍历
  class S3 {
    static func test() {
      let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
      let ret = Solution().preorderTraversal(root)
      assert(ret == [1, 2, 4, 5, 3, 6, 7])
    }
    
    /*
     
     作者：LeetCode-Solution
     链接：https://leetcode.cn/problems/binary-tree-preorder-traversal/solution/er-cha-shu-de-qian-xu-bian-li-by-leetcode-solution/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    class Solution {
      func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        
        if (root == nil) {
          return res;
        }
        
        var p1: TreeNode? = root
        var p2: TreeNode? = nil;
        
        while (p1 != nil) {
          p2 = p1?.left;
          if (p2 != nil) {
            while (p2?.right != nil && p2?.right !== p1) {
              p2 = p2?.right;
            }
            
            if (p2?.right == nil) {
              res.append(p1?.val ?? 0);
              p2?.right = p1;
              p1 = p1?.left;
              continue;
            } else {
              p2?.right = nil;
            }
          } else {
            res.append(p1?.val ?? 0);
          }
          p1 = p1?.right;
        }
        return res;
        
      }
    }
  }
}

extension Solution144 {
  /// 优化 S2
  class S4 {
    class Solution {
      func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        
        var stack = [TreeNode]()
        var results = [Int]()
        var node = root
        
        while true {
          if node != nil {
            results.append(node!.val)
            
            if let right = node?.right {
              stack.append(right)
            }
            node = node?.left
          } else {
            if stack.isEmpty {
              return results
            } else {
              node = stack.removeLast()
            }
          }
        }
      }
      
      static func test() {
        let root = TreeNode.create(from: [1, 2, 3, 4, 5, 6, 7])
        let ret = Solution().preorderTraversal(root)
        assert(ret == [1, 2, 4, 5, 3, 6, 7])
      }
    }
  }
}
