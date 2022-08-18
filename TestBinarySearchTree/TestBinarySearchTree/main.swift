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


func testTreeHeight() {
  let tree = BinarySearchTree()
  tree.add(5)
  tree.add(4)
  tree.add(6)
  tree.add(7)
  tree.add(8)
  
  assert(Solution.height(of: tree.root) == 4)
  
  assert(Solution.height2(of: tree.root) == 4)
}

testTreeHeight()

func testIsComplete() {
  
  func buildTree(_ array: [Int]) -> BinarySearchTree {
    let tree = BinarySearchTree()
    for element in array {
      tree.add(element)
    }
    
    return tree
  }
  
  assert(Solution.isCompleteTree(buildTree([6, 4, 5, 7, 8]).root) == false)
  assert(Solution.isCompleteTree(buildTree([6, 4, 3, 7, 8]).root) == false)
  assert(Solution.isCompleteTree(buildTree([6]).root) == true)
  assert(Solution.isCompleteTree(buildTree([6, 4, 7]).root) == true)
  assert(Solution.isCompleteTree(buildTree([6, 4, 7, 3]).root) == true)
}

testIsComplete()
