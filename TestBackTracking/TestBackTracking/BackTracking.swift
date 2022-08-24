//
//  BackTracking.swift
//  TestBackTracking
//
//  Created by brookxy on 2022/8/24.
//

import Foundation

private extension Optional {
    var printed: String {
        if let value = self {
            return "\(value)"
        } else {
            return "nil"
        }
    }
}

public class BsckTracking {
    private class TreeNode<Value> {
        var value: Value
        var left: TreeNode?
        var right: TreeNode?
        
        init(value: Value,
             left: TreeNode?,
             right: TreeNode?) {
            self.value = value
            self.left = left
            self.right = right
        }
        
        static func buildTree(array: [Value]) -> TreeNode? {
            return nil
        }
    }
    
    public static func treePreorderTranversal() {
        
    }
    
    public static func treePreorderTranversal_recursion() {
        let tree = TreeNode.buildTree(array: [3, 4, 5, 6, 7])
        treePreorderTranversal_recursion(tree: tree)
    }
    
    private static func treePreorderTranversal_recursion<Value>(tree: TreeNode<Value>?) {
        guard let tree = tree else { return }
        
        print(tree.value)
        treePreorderTranversal_recursion(tree: tree.left)
        treePreorderTranversal_recursion(tree: tree.right)
    }
}
