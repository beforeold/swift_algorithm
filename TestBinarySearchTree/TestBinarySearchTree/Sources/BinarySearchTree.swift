//
//  BinarySearchTree.swift
//  TestBinarySearchTree
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation
import DataStructure

public class BinarySearchTree<Element: Comparable> {
  public var root: TreeNode<Element>?
  
  private var size: Int = 0
  
  public func getSize() -> Int {
    return size
  }
  
  public func add(_ val: Element) {
    let newNode = TreeNode(val, nil, nil)
    
    if root == nil {
      root = newNode
      size += 1
      return
    }
    
    var node = root
    var targetParent: TreeNode<Element>?
    var compareRet = 0
    
    while (node != nil) {
      targetParent = node
      
      let unboxNode = node!
      compareRet = compare(e1: val, e2: unboxNode.element)
      
      if compareRet > 0 {
        node = node?.right
      } else if compareRet < 0 {
        node = node?.left
      }
      else {
        node?.val = val
      }
    }
    
    newNode.parent = targetParent
    
    if compareRet > 0 {
      targetParent?.right = newNode
      size += 1
    } else if compareRet < 0 {
      targetParent?.left = newNode
      size += 1
    } else {
      //
    }
  }
  
  /// 对比两个元素, 如果 e1 > e2 返回 1，小于返回 -1，否则返回 0
  private func compare(e1: Element, e2: Element) -> Int {
    if e1 > e2 {
      return 1
    } else if e1 < e2 {
      return -1
    } else {
      return 0
    }
  }
  
  public func remove(_ val: Int) {
    
  }
  
  private func preorderNode(of node: TreeNode<Element>?) -> TreeNode<Element>? {
    return nil
  }
}

extension BinarySearchTree {
  public func preorderTranversal(using block: (TreeNode<Element>) -> Void) {
    preorderTranversal(node: root, using: block)
  }
  
  private func preorderTranversal(node: TreeNode<Element>?, using block: (TreeNode<Element>) -> Void) {
    guard let node = node else { return }
    
    block(node)
    preorderTranversal(node: node.left, using: block)
    preorderTranversal(node: node.right, using: block)
  }
  
  public func inorderTranversal(using block: (TreeNode<Element>) -> Void) {
    inorderTranversal(node: root, using: block)
  }
  
  private func inorderTranversal(node: TreeNode<Element>?, using block: (TreeNode<Element>) -> Void) {
    guard let node = node else { return }
    
    inorderTranversal(node: node.left, using: block)
    block(node)
    inorderTranversal(node: node.right, using: block)
  }
  
  public func postorderTranversal(using block: (TreeNode<Element>) -> Void) {
    postorderTranversal(node: root, using: block)
  }
  
  private func postorderTranversal(node: TreeNode<Element>?, using block: (TreeNode<Element>) -> Void) {
    guard let node = node else { return }
    
    inorderTranversal(node: node.left, using: block)
    inorderTranversal(node: node.right, using: block)
    block(node)
  }
  
  public func levelOrderTranversal(using block: (TreeNode<Element>) -> Void) {
    guard let root = root else { return }
    
    let queue = Queue<TreeNode<Element>>()
    queue.push(root)
    while (!queue.isEmpty()) {
      let node = queue.pop()
      block(node)
      node.left.map(queue.push)
      node.right.map(queue.push)
    }
  }
}

