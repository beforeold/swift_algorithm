//
//  UnionFind.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Cocoa

public class UnionFind_QF {
  private var parents: [Int] = []
  
  public init(length: Int) {
    for i in 0..<length {
      parents.insert(i, at: i)
    }
  }
  
  public func find(_ val: Int) -> Int {
    return parents[val]
  }
  
  public func union(_ v1: Int, _ v2: Int) {
    let p1 = find(v1)
    let p2 = find(v2)
    if p1 == p2 { return }
    
    for i in 0..<parents.count {
      if parents[i] == p1 {
        parents[i] = p2
      }
    }
  }
  
  public func isSame(_ v1: Int, _ v2: Int) -> Bool {
    return find(v1) == find(v2)
  }
}
