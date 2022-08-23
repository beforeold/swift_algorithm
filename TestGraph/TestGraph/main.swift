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
  print(graph.verticesSize())
  print(graph.edgesSize())
  
  graph.removeVertex(5)
  print(graph.verticesSize())
  print(graph.edgesSize())
}


testListGraph()
