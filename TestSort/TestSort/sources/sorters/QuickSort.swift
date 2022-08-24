//
//  QuickSort.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/23.
//

import Cocoa

public class QuickSort<E: Comparable>: Sorter<E> {
    public override func sort() {
        if array.length < 2 { return }
        sort(0, array.length)
    }
    
    private func sort(_ begin: Int, _ end: Int) {
        if end - begin < 2 { return }
        print("sort begin:\(begin) end: \(end)")
        let mid = pivotIndex(begin, end)
        sort(begin, mid)
        sort(mid + 1, end)
    }
    letp
    private func pivotIndex(_ begin: Int, _ end: Int) -> Int {
        print("pivotIndex begin:\(begin) end: \(end)")
        var begin = begin
        var end = end - 1
        
        let pivot = array[begin]
        
        while (begin < end) {
            while (begin < end) {
                if cmp(pivot, array[end]) < 0 {
                    end -= 1
                } else {
                    swap(begin, end)
                    begin += 1
                    break
                }
            }
            
            while (begin < end) {
                if cmp(array[begin], pivot) < 0 {
                    begin += 1
                } else {
                    swap(begin, end)
                    end -= 1
                    break
                }
            }
        }
        
        array[begin] = pivot
        
        return begin
    }
}
