//
//  main.swift
//  TestUnionFind
//
//  Created by Brook16 on 2022/8/23.
//

import Foundation

func testQF() {
  let uf = UnionFind_QF(length: 10)
  
  uf.union(0, 1)
  uf.union(1, 2)
  
  uf.union(6, 7)
  
  uf.union(8, 9)
  
  print(uf.isSame(0, 2))
  print(uf.isSame(6, 7))
  print(uf.isSame(8, 9))
  
  print("------")
  
  print(uf.isSame(0, 6))
  print(uf.isSame(6, 8))
  print(uf.isSame(2, 8))
  
  uf.union(0, 7)
  uf.union(6, 9)
  
  print("------")
  
  print(uf.isSame(0, 6))
  print(uf.isSame(6, 8))
  print(uf.isSame(2, 8))
  
}


testQF()
