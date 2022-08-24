//
//  Recursion.swift
//  TestRecursion
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

public class Recursion {
  /// 1 + 2 + 3 + ... + n
  public static func sum_recursion(_ n: Int) -> Int {
    if n <= 1 { return n }
    return n + sum_recursion(n - 1)
  }
  
  public static func sum(_ n: Int) -> Int {
    guard n > 1 else { return n }
    
    var sum = 0
    for i in 1...n {
      sum += i
    }
    return sum
  }
}
