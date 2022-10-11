//
//  BinaryHeap.swift
//  TestHeap
//
//  Created by beforeold on 2022/10/11.
//

import Foundation

public protocol Heap {
  associatedtype Element: Comparable
  
  /// get size of the heap
  ///
  /// - Complexity: O(1)
  var size: Int { get }
  
  /// depend on the size
  ///
  /// - Complexity: O(1)
  var isEmpty: Bool { get }
  
  /// clear the heap
  func clear()
  
  /// add an element to keep the heap feature
  func add(_ element: Element)
  
  /// get the root element
  func get() -> Element
  
  /// remove the root element
  func remove() -> Element
  
  /// replace the root element
  func replace(_ element: Element) -> Element
}


public func HeapDefaultComparator<Element: Comparable>(_ e1: Element, _ e2: Element) -> Int {
  if e1 < e2 {
    return -1
  }
  else if e1 > e2 {
    return 1
  }
  return 0
}

public class BinaryHeap<Element: Comparable>: Heap {
  public private(set) var size: Int
  private var container = [Element?]()
  private let comparator: (_ e1: Element, _ e2: Element) -> Int
  
  public init(array: [Element] = [],
              comparator: @escaping (_ e1: Element, _ e2: Element) -> Int = HeapDefaultComparator) {
    self.container = array
    self.size = array.count
    self.comparator = comparator
    
    heapify()
  }
  
  public var isEmpty: Bool {
    return size == 0
  }
  
  public func clear() {
    for i in 0..<size {
      container[i] = nil
    }
    
    size = 0
  }
  
  public func add(_ element: Element) {
    container.append(element)
    size += 1
    
    siftUp(size - 1)
  }
  
  public func get() -> Element {
    emptyCheck()
    
    return container[0]!
  }
  
  public func remove() -> Element {
    emptyCheck()
    
    let rootValue = element(at: 0)
    let tail = container[size - 1]
    container[0] = tail
    container[size - 1] = nil
    size -= 1
    
    siftUp(0)
    
    return rootValue
  }
  
  public func replace(_ element: Element) -> Element {
    emptyCheck()
    
    let rootValue = self.element(at: 0)
    container[0] = element
    siftDown(0)
    
    return rootValue
  }
  
  // MARK: - private
  private func siftUp(_ index: Int) {
    var index = index
    let iValue = element(at: index)
    
    while index > 0 {
      let parentIndex = (index - 1) / 2
      let parentValue = element(at: parentIndex)
      
      if comparator(parentValue, iValue) >= 0 {
        return
      }
      
      // swap
      container[parentIndex] = iValue
      container[index] = parentValue
      
      index = parentIndex
    }
  }
  
  private func siftDown(_ index: Int) {
    let iValue = element(at: index)
    var index = index
    
    // 完全二叉树性质：计算最小非叶子结点的个数
    let half = size / 2
    
    while index < half {
      // 由于右子结点可能不存在，所以先默认赋值为左子结点
      var childIndex = 2 * index + 1
      var childValue = element(at: childIndex)
      
      // 判断右子树是否可能为更大值
      let rightIndex = childIndex + 1
      if rightIndex < size {
        let rightValue = element(at: rightIndex)
        if comparator(rightValue, childValue) > 0 {
          childIndex = rightIndex
          childValue = rightValue
        }
      }
      
      if comparator(iValue, childValue) > 0 {
        break
      }
      
      container[index] = childValue
      index = childIndex
    }
    
    container[index] = iValue
  }
  
  private func siftUp_opt(_ index: Int) {
    var index = index
    let iValue = element(at: index)
    
    while index > 0 {
      let parentIndex = (index - 1) / 2
      let parentValue = element(at: parentIndex)
      
      if comparator(parentValue, iValue) >= 0 {
        break
      }
      
      // pass down parent value and continue
      container[index] = parentValue
      index = parentIndex
    }
    
    container[index] = iValue
  }
  
  private func element(at index: Int) -> Element {
    return container[index]!
  }
  
  /// let container act as heap for initializer
  private func heapify() {
    heapify_siftDown()
  }
  
  private func heapify_siftUp() {
    for i in 0..<size {
      siftUp(i)
    }
  }
  
  private func heapify_siftDown() {
    // half 是非叶子结点的个数
    let half = size / 2
    for i in (0..<half).reversed() {
      siftDown(i)
    }
  }
  
  private func emptyCheck() {
    if isEmpty {
      fatalError("the heap is empty")
    }
  }
}
