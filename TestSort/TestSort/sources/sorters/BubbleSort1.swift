//
//  BubbleSort1.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Cocoa

/// 从序列的首元素开始两两对比，如果是大的元素则交换，直到尾部为最大的元素 0 ~ (length-1)；
/// 然后，从头开始继续， 0 ~ (length - 2)
public class BubbleSort1<E: Comparable>: Sorter<E> {
    public override func sort() {
        for i in 0..<array.length {
            let end = array.length - i - 1
            for k in 0..<end {
                if cmp(k, k + 1) > 0 {
                    swap(k, k + 1)
                }
            }
        }
    }
}
