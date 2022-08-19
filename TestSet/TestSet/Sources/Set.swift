//
//  Set.swift
//  TestSet
//
//  Created by Brook16 on 2022/8/19.
//

import Foundation

public protocol Set {
    associatedtype E: Comparable
    
    func getSize() -> Int
    
    func add(_ e: E)
    
    func remove(_ e: E)
    
    func clear()
    
    func isEmpty() -> Bool
}
