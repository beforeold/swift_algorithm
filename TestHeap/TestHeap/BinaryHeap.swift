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
    public private(set) var size: Int = 0
    private var container = [Element?]()
    private let comparator: (_ e1: Element, _ e2: Element) -> Int
    
    public init(comparator: @escaping (_ e1: Element, _ e2: Element) -> Int = HeapDefaultComparator) {
        self.comparator = comparator
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
        return container[0]!
    }
    
    public func remove() -> Element {
        fatalError()
    }
    
    public  func replace(_ element: Element) -> Element {
        fatalError()
    }
    
    // MARK: - private
    private func siftUp(_ index: Int) {
        var index = index
        let iValue = element(at: index)
        
        while index > 0 {
            let pIndex = (index - 1) / 2
            let pValue = element(at: pIndex)
            
            if comparator(pValue, iValue) >= 0 {
                return
            }
            
            // swap
            container[pIndex] = iValue
            container[index] = pValue
            
            index = pIndex
        }
    }
    
    private func siftUp_opt(_ index: Int) {
        var index = index
        let iValue = element(at: index)
        
        while index > 0 {
            let pIndex = (index - 1) / 2
            let pValue = element(at: pIndex)
            
            if comparator(pValue, iValue) >= 0 {
                break
            }
            
            // pass down parent value and continue
            container[index] = pValue
            
            index = pIndex
        }
        
        container[index] = iValue
    }
    
    private func element(at index: Int) -> Element {
        return container[index]!
    }
}
