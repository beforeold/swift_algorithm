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

extension BinarySearchTree {
  public func preorderTranversal(using block: (TreeNode) -> Void) {
    preorderTranversal(node: root, using: block)
  }
  
  private func preorderTranversal(node: TreeNode?, using block: (TreeNode) -> Void) {
    guard let node = node else { return }
    
    block(node)
    preorderTranversal(node: node.left, using: block)
    preorderTranversal(node: node.right, using: block)
  }
  
  public func inorderTranversal(using block: (TreeNode) -> Void) {
    inorderTranversal(node: root, using: block)
  }
  
  private func inorderTranversal(node: TreeNode?, using block: (TreeNode) -> Void) {
    guard let node = node else { return }
    
    inorderTranversal(node: node.left, using: block)
    block(node)
    inorderTranversal(node: node.right, using: block)
  }
  
  public func postorderTranversal(using block: (TreeNode) -> Void) {
    postorderTranversal(node: root, using: block)
  }
  
  private func postorderTranversal(node: TreeNode?, using block: (TreeNode) -> Void) {
    guard let node = node else { return }
    
    inorderTranversal(node: node.left, using: block)
    inorderTranversal(node: node.right, using: block)
    block(node)
  }
  
  public func levelOrderTranversal(using block: (TreeNode) -> Void) {
    guard let root = root else { return }
    
    let queue = Queue<TreeNode>()
    queue.push(root)
    while (!queue.isEmpty()) {
      let node = queue.pop()
      block(node)
      node.left.map(queue.push)
      node.right.map(queue.push)
    }
  }
}

