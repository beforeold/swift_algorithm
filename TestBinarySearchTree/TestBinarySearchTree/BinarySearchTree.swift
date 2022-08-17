//
//  BinarySearchTree.swift
//  TestBinarySearchTree
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

public class BinarySearchTree {
    public var root: TreeNode?
    
    private var size: Int = 0
    
    public func add(_ val: Int) {
        let newNode = TreeNode(val, nil, nil)
        
        if root == nil {
            root = newNode
            size += 1
            return
        }
        
        var node = root
        var targetParent: TreeNode?
        var compare: Int = 0
        
        while (node != nil) {
            targetParent = node
            
            let unboxNode = node!
            compare = val - unboxNode.val
            
            if compare > 0 {
                node = node?.right
            } else if compare < 0 {
                node = node?.left
            }
            else {
                node?.val = val
            }
        }
        
        newNode.parent = targetParent
        
        if compare > 0 {
            targetParent?.right = newNode
            size += 1
        } else if compare < 0 {
            targetParent?.left = newNode
            size += 1
        } else {
            //
        }
    }
}
