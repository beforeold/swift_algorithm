//
//  BubbleSort1.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Cocoa

public class BubbleSort1<T: Comparable>: Sorter<T> {
    public override func sort() {
        for i in 0..<array.length {
            let end = array.length - i - 1
            for k in 0..<end {
                if isGreater(k, k + 1) {
                    swap(k, k + 1)
                }
            }
        }
    }
}
