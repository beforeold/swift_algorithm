//
//  Sorter.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation
import DataStructure

open class Sorter<T: Comparable> {
    public let array: FullStaticArray<T>
    
    public init(array: FullStaticArray<T>) {
        self.array = array
        
        sort()
    }
    
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
}

extension Sorter: CustomStringConvertible {
    public var description: String {
        return array.description
    }
}
