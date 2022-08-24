//
//  DivideAndConquer.swift
//  TestDivideAndConquer
//
//  Created by brookxy on 2022/8/24.
//

import Foundation


public class DivideAndConquer {
    public static func quickSort<E>(_ array: inout [E]) where E: Comparable {
        if array.count < 2 { return }
        
        self.quickSort(&array, begin: 0, end: array.count)
    }
    
    private static func quickSort<E>(_ array: inout [E], begin: Int, end: Int) where E: Comparable {
        if end - begin < 2 { return }
        let mid = pivotIndex(&array, begin: begin, end: end)
        quickSort(&array, begin: begin, end: mid)
        quickSort(&array, begin: mid + 1, end: end)
    }
    
    private static func pivotIndex<E>(_ array: inout [E], begin: Int, end: Int) -> Int where E: Comparable {
        // TODO: pivot value, random index will be better
        var begin = begin
        var end = end - 1
        let pivot = array[begin]
        
        while (begin < end) {
            while (begin < end) {
                if array[end] > pivot {
                    end -= 1
                } else {
                    array[begin] = array[end]
                    begin += 1
                    break
                }
            }
            
            while (begin < end) {
                if array[begin] < pivot {
                    begin += 1
                } else {
                    array[end] = array[begin]
                    end -= 1
                    break
                }
            }
        }
        
        return 0
    }
}
