//
//  main.swift
//  TestGraph
//
//  Created by BrookXy on 2022/8/23.
//

import Foundation

func testListGraph() {
  let graph = ListGraph<Int, Never>()
  graph.addVertex(5)
  graph.addVertex(6)
  graph.addEdge(from: 5, to: 6, weight: nil)
  graph.addEdge(from: 6, to: 5, weight: nil)
  graph.addVertex(7)
  graph.addEdge(from: 5, to: 7, weight: nil)
  print(graph)
  
  graph.removeEdge(from: 5, to: 6)
  print(graph)
  
  graph.removeVertex(5)
  print(graph)
  
  graph.removeVertex(6)
  graph.removeVertex(7)
  print(graph)
}


testListGraph()
