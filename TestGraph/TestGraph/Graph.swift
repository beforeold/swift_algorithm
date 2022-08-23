//
//  Graph.swift
//  TestGraph
//
//  Created by BrookXy on 2022/8/23.
//

import Foundation

public protocol Graph {
  associatedtype Element: Equatable
  associatedtype Weight
  
  func edgesSize() -> Int
  func verticesSize() -> Int
  
  func addVertex(_ value: Element)
  func addEdge(from: Element, to: Element, weight: Weight?)
  
  func removeVertex(_ value: Element)
  func removeEdge(from: Element, to: Element)
}
