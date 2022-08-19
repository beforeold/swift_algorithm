//
//  ListSet.swift
//  TestSet
//
//  Created by Brook16 on 2022/8/19.
//

import Foundation

public class ListSet<E: Comparable>: Set {
  private var elements = [E]()
  
  public func getSize() -> Int {
    return elements.count
  }
  
  public func add(_ e: E) {
    
  }
  
  public func remove(_ e: E) {
    
  }
  
  public func clear() {
    elements = []
  }
  
  public func isEmpty() -> Bool {
    return elements.isEmpty
  }
  
}
