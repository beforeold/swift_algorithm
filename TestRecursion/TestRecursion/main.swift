//
//  main.swift
//  TestRecursion
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

func testSum() {
  var n = 1
  print(Recursion.sum_recursion(n))
  print(Recursion.sum(n))
  
  n = 100
  print(Recursion.sum_recursion(n))
  print(Recursion.sum(n))
}

testSum()
