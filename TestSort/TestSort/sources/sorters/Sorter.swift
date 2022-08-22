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
    
    public func isLess(_ i1: Int, _ i2: Int) -> Bool {
        return array[i1] < array[i2]
    }
    
    public func isGreater(_ i1: Int, _ i2: Int) -> Bool {
        return array[i1] > array[i2]
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
