//
//  UnionFindable.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Foundation

public protocol UnionFindable {
  init(length: Int)
  
  func find(_ val: Int) -> Int
  
  func union(_ v1: Int, _ v2: Int)
}

public extension UnionFindable {
  func isSame(_ v1: Int, _ v2: Int) -> Bool {
    return find(v1) == find(v2)
  }
}
