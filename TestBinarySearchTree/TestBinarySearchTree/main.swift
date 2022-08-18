//
//  main.swift
//  TestBinarySearchTree
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation

func testTree() {
  let tree = BinarySearchTree()
  tree.add(5)
  tree.add(4)
  tree.add(6)
  tree.add(7)
  tree.add(8)
  print(tree)
}

func treeTranversal() {
  let tree = BinarySearchTree()
  tree.add(5)
  tree.add(4)
  tree.add(6)
  tree.add(7)
  tree.add(8)
  
  func display( _ val: TreeNode) {
    print(val)
  }
  
  print(tree)
  
  print("")
  tree.preorderTranversal(using: display)
  
  print("")
  tree.inorderTranversal(using: display)
  
  print("")
  tree.postorderTranversal(using: display)
  
  print("")
  tree.levelOrderTranversal(using: display)
}

treeTranversal()
