//
//  UnionFind_QF.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Cocoa

public class UnionFind_QF: UnionFindable {
  private var parents: [Int] = []
  
  required public init(length: Int) {
    for i in 0..<length {
      parents.insert(i, at: i)
    }
  }
  
  public func find(_ val: Int) -> Int? {
    return parents[val]
  }
  
  public func union(_ v1: Int, _ v2: Int) {
    guard let p1 = find(v1), let p2 = find(v2) else {
      return
    }
    
    if p1 == p2 { return }
    
    for i in 0..<parents.count {
      if parents[i] == p1 {
        parents[i] = p2
      }
    }
  }
}
