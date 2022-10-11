//
//  PriorityQueue.swift
//  TestHeap
//
//  Created by beforeold on 2022/10/11.
//

import Foundation

public class PriorityQueue<Element> {
  private var heap: BinaryHeap<Element>
  
  public init(comparator: @escaping (_ e1: Element, _ e2: Element) -> Int) {
    self.heap = BinaryHeap(comparator: comparator)
  }
  
  public var size: Int {
    return heap.size
  }
  
  public var isEmpty: Bool {
    return heap.isEmpty
  }
  
  public func clear() {
    return heap.clear()
  }
  
  public func enqueue(_ element: Element) {
    heap.add(element)
  }
  
  public func dequeue() -> Element {
    heap.remove()
  }
  
  public var font: Element? {
    return isEmpty ? nil : heap.get()
  }
}

extension PriorityQueue where Element: Comparable {
  public convenience init() {
    self.init(comparator: MaxFirstComparator)
  }
}
