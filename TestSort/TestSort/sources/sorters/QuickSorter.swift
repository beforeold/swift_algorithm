//
//  QuickSorter.swift
//  TestSort
//
//  Created by beforeold on 2022/9/2.
//

import Foundation

class QuickSorter<E: Comparable> {
    static func sort(_ array: inout [E]) {
        sort(begin: 0, end: array.count, array: &array)
    }
    
    private static func sort(begin: Int, end: Int, array: inout [E]) {
        guard end - begin > 1 else {
            return
        }
        
        let pIndex = makePivot(begin: begin, end: end, array: &array)
        sort(begin: begin, end: pIndex, array: &array)
        sort(begin: pIndex + 1, end: end, array: &array)
    }
    
    private static func makePivot(begin: Int, end: Int, array: inout [E]) -> Int {
        // 1. setup begin and end
        var begin = begin
        var end = end - 1
        
        // 2. keep begin value
        let pivotValue = array[begin]
        
        // 3. make pivot
        while begin < end {
            while begin < end {
                if pivotValue < array[end] {
                    end -= 1
                } else {
                    array[begin] = array[end]
                    begin += 1
                    break
                }
            }
            
            while begin < end {
                if array[begin] < pivotValue {
                    begin += 1
                } else {
                    array[end] = array[begin]
                    end -= 1
                    break
                }
            }
        }
        
        // 4. save pivot value
        array[begin] = pivotValue
        
        return begin
    }
}
