//
//  BinaryHeap.swift
//  TestHeap
//
//  Created by beforeold on 2022/10/11.
//

import Foundation

public protocol Heap {
  associatedtype Element
  
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

/// 大顶堆比较器
public func MaxFirstComparator<Element: Comparable>(_ e1: Element, _ e2: Element) -> Int {
  if e1 < e2 {
    return -1
  }
  else if e1 > e2 {
    return 1
  }
  return 0
}

/// 小顶堆比较器
public func MinFirstComparator<Element: Comparable>(_ e1: Element, _ e2: Element) -> Int {
  return -MaxFirstComparator(e1, e2)
}

public class BinaryHeap<Element>: Heap {
  public private(set) var size: Int
  fileprivate var container = [Element?]()
  private let comparator: (_ e1: Element, _ e2: Element) -> Int
  
  public init(array: [Element] = [],
              comparator: @escaping (_ e1: Element, _ e2: Element) -> Int) {
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

extension BinaryHeap where Element: Comparable {
  /// to support MaxRoot for comparable
  public convenience init(array: [Element] = []) {
    self.init(array: array, comparator: MaxFirstComparator)
  }
}

extension Array where Element: Comparable {
  /// init an array from an binary heap
  public init(_ binaryHeap: BinaryHeap<Element>) {
    self = binaryHeap.container.map { $0! }
  }
}


/// 利用小顶堆进行过滤实现
///
/// 返回的数组是**没有**排序的
///
/// - Complexity: O(nlogk)，空间复杂度 O(k)
func minRoot_topK(of array: [Int], k: Int) -> [Int] {
  let heap = BinaryHeap<Int>(comparator: MinFirstComparator)
  
  // O(n * logk)
  for element in array {
    if heap.size < k {
      heap.add(element)
    } else if element > heap.get() {
      _ = heap.replace(element)
    } else {
      // small element will be ignored
    }
  }
  
  return Array(heap)
}


/// 利用大顶堆批量建堆后，逐个 remove 实现
///
/// 返回的数组是排序的，时间复杂度相对较差
///
/// - Complexity: 时间复杂度 O(n + klogn)，空间复杂度 O(n + k)
func maxRoot_topK(of array: [Int], k: Int) -> [Int] {
  // O(n)
  let heap = BinaryHeap<Int>(array: array)
  
  var ret = [Int]()
  let size = min(heap.size, k)
  
  // O(k * logn)
  for _ in 0..<size {
    ret.append(heap.remove())
  }
  
  return ret
}
