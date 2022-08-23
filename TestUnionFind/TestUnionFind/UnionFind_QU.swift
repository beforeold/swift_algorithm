//
//  UnionFind_QU.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Cocoa

public class UnionFind_QU: UnionFindable {
  private var parents: [Int] = []
  
  required public init(length: Int) {
    for i in 0..<length {
      parents.insert(i, at: i)
    }
  }
  
  public func find(_ val: Int) -> Int {
    var val = val
    while (val != parents[val]) {
      val = parents[val]
    }
    return val
  }
  
  public func union(_ v1: Int, _ v2: Int) {
    let p1 = find(v1)
    let p2 = find(v2)
    if (p1 == p2) { return }
    parents[p1] = p2
  }
}
