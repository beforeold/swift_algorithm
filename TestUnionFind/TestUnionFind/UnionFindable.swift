//
//  UnionFindable.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Foundation

public protocol UnionFindable {
  associatedtype V: Equatable
  
  init(length: Int)
  
  func find(_ val: V) -> V?
  
  func union(_ v1: V, _ v2: V)
}

public extension UnionFindable {
  func isSame(_ v1: V, _ v2: V) -> Bool {
    return find(v1) == find(v2)
  }
}
