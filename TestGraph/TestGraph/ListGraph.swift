//
//  ListGraph.swift
//  TestGraph
//
//  Created by BrookXy on 2022/8/23.
//

import Foundation

public class ListGraph<Element: Equatable, Weight>: Graph {
  /// be subclass of NSObject, for Hashable
  class Edge: NSObject {
    unowned var from: Vertex
    unowned var to: Vertex
    var weight: Weight?
    
    init(from: Vertex, to: Vertex, weight: Weight? = nil) {
      self.from = from
      self.to = to
      self.weight = weight
    }
    
    override func isEqual(to object: Any?) -> Bool {
      guard let rhs = object as? Edge else {
        return false
      }
      
      return self.from === rhs.from && self.to === rhs.to
    }
    
    override var hash: Int {
      return 31 * from.hash + to.hash
    }
  }
  
  class Vertex: NSObject {
    var value: Element
    var outEdges: Set<Edge> = []
    var inEdges: Set<Edge> = []
    
    init(_ value: Element) {
      self.value = value
    }
    
    func add(outEdge: Edge) -> Bool {
      if outEdges.contains(outEdge) {
        return false
      }
      
      outEdges.insert(outEdge)
      return true
    }
    
    func remove(outEdge: Edge) {
      outEdges.remove(outEdge)
    }
    
    @discardableResult
    func add(inEdge: Edge) -> Bool {
      if inEdges.contains(inEdge) {
        return false
      }
      
      inEdges.insert(inEdge)
      return true
    }
    
    func remove(inEdge: Edge) {
      inEdges.remove(inEdge)
    }
  }
  
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
    
    let vertext = vertices.remove(at: index)
    var count = vertext.outEdges.count
    
    vertext.inEdges.forEach { edge in
      count += 1
      edge.from.remove(outEdge: edge)
    }
    edgesCount -= count
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
    fromVertex.remove(outEdge: edge)
    toVertex.remove(inEdge: edge)
  }
}
