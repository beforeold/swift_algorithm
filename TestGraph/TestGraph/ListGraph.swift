//
//  ListGraph.swift
//  TestGraph
//
//  Created by BrookXy on 2022/8/23.
//

import Foundation

public class ListGraph<Element: Hashable, Weight>: Graph {
  private var vertices: [Vertex] = []
  private var edgesCount = 0
  private var verticesCount = 0
  
  public func edgesSize() -> Int {
    return edgesCount
  }
  
  public func verticesSize() -> Int {
    return verticesCount
  }
  
  public func addVertex(_ value: Element) {
    let vertex = Vertex(value)
    vertices.append(vertex)
    verticesCount += 1
  }
  
  public func addEdge(from: Element,
                      to: Element,
                      weight: Weight?) {
    guard let fromVertex = findVertex(of: from),
          let toVertex = findVertex(of: to) else {
      return
    }
    
    let edge = Edge(from: fromVertex, to: toVertex, weight: weight)
    if fromVertex.add(outEdge: edge) {
      edgesCount += 1
    }
    toVertex.add(inEdge: edge)
  }
  
  public func removeVertex(_ value: Element) {
    let index = vertices.firstIndex { vertex in
      vertex.value == value
    }
    
    guard let index = index else { return }
    
    let vertex = vertices.remove(at: index)
    verticesCount -= 1
    
    // do not point at other
    var removedEdgeCount = vertex.outEdges.count
    vertex.outEdges.forEach { edge in
      edge.to.remove(inEdge: edge)
    }
    
    // do not point at me
    vertex.inEdges.forEach { edge in
      if (edge.from.remove(outEdge: edge)) {
        removedEdgeCount += 1
      }
    }
    
    edgesCount -= removedEdgeCount
  }
  
  private func findVertex(of value: Element) -> Vertex? {
    return vertices.first { vertext in
      vertext.value == value
    }
  }
  
  public func removeEdge(from: Element, to: Element) {
    guard let fromVertex = findVertex(of: from),
          let toVertex = findVertex(of: to) else {
      return
    }
    
    let edge = Edge(from: fromVertex, to: toVertex)
    if fromVertex.remove(outEdge: edge) {
      edgesCount -= 1
    }
    toVertex.remove(inEdge: edge)
  }
}

extension ListGraph: CustomStringConvertible {
  public var description: String {
    return "verticesSize: \(verticesSize()), edgesSize: \(edgesSize()), \(vertices)"
  }
}

extension ListGraph {
  /// be subclass of NSObject, for Hashable
  class Edge {
    unowned var from: Vertex
    unowned var to: Vertex
    var weight: Weight?
    
    init(from: Vertex, to: Vertex, weight: Weight? = nil) {
      self.from = from
      self.to = to
      self.weight = weight
    }
  }
}

extension ListGraph.Edge: Hashable {
  static func ==(lhs: ListGraph.Edge, rhs: ListGraph.Edge) -> Bool {
    return lhs.from === rhs.from && lhs.to === rhs.to
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(from)
    hasher.combine(to)
  }
}

extension ListGraph.Edge: CustomStringConvertible {
  var description: String {
    return "(\(from.value) --> \(to.value))"
  }
}

extension ListGraph {
  class Vertex {
    var value: Element
    var outEdges: Set<Edge> = []
    var inEdges: Set<Edge> = []
    
    init(_ value: Element) {
      self.value = value
    }
    
    func add(outEdge edge: Edge) -> Bool {
      if outEdges.contains(edge) {
        return false
      }
      
      outEdges.insert(edge)
      return true
    }
    
    func remove(outEdge edge: Edge) -> Bool {
      if outEdges.contains(edge) {
        outEdges.remove(edge)
        return true
      }
      return false
    }
    
    @discardableResult
    func add(inEdge edge: Edge) -> Bool {
      if inEdges.contains(edge) {
        return false
      }
      
      inEdges.insert(edge)
      return true
    }
    
    @discardableResult
    func remove(inEdge edge: Edge) -> Bool {
      if inEdges.contains(edge) {
        inEdges.remove(edge)
        return true
      }
      
      return false
    }
  }
}

extension ListGraph.Vertex: Hashable {
  static func == (lhs: ListGraph.Vertex, rhs: ListGraph.Vertex) -> Bool {
    return lhs.value == rhs.value
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(value)
  }
}

extension ListGraph.Vertex: CustomStringConvertible {
  var description: String {
    var string = "\(value)"
    string += "->("
    for (index, ege) in outEdges.enumerated() {
      if index != 0 {
        string += ","
      }
      string += "\(ege.to.value)"
    }
    string += ")"
    
    return string
  }
}
