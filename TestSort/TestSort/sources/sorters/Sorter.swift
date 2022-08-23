//
//  Sorter.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation
import DataStructure

open class Sorter<E: Comparable> {
    public let array: FullStaticArray<E>
    
    public init(_ array: FullStaticArray<E>) {
        self.array = array
        
        _sort()
    }
    
    /// for subclass overriding
    open func sort() {
        
    }
    
    public func cmp(_ i1: Int, _ i2: Int) -> Int {
        return cmp(array[i1], array[i2])
    }
    
    public func cmp(_ e1: E, _ e2: E) -> Int {
        if e1 > e2 {
            return 1
        } else if e1 < e2 {
            return -1
        } else {
            return 0
        }
    }
    
    public func swap(_ i1: Int, _ i2: Int) {
        (array[i1], array[i2]) = (array[i2], array[i1])
    }
    
    private func _sort() {
        sort()
    }
}

extension Sorter: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
