//
//  UnionFind.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Foundation

public class UnionFind<V: Hashable>: UnionFindable {
  private class Node {
    var val: V
    weak var parent: Node?
    
    init(val: V) {
      self.val = val
      self.parent = self
    }
  }
  
  private var map: [V: Node] = [:]
              
  public init() { }
  public required init(length: Int) { }
  
  public func find(_ val: V) -> V? {
    return findRootNode(of: val)?.val
  }
  
  public func union(_ v1: V, _ v2: V) {
    guard let root1 = findRootNode(of: v1),
          let root2 = findRootNode(of: v2) else {
      return
    }
    
    if root1 === root2 {
      return
    }
    
    root1.parent = root2
  }
  
  public func makeSet(_ val: V) {
    guard map[val] == nil else {
      return
    }
    
    let node = Node(val: val)
    map[val] = node
  }
  
  private func findRootNode(of val: V) -> Node? {
    var node = map[val]
    while (node?.val != node?.parent?.val) {
      node = node?.parent
    }
    return node
  }
}
