//
//  BubbleSort3.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation

/// 优化 BunbleSort1 和 BundleSort2，记录最后一次交换的位置，作为下一次循环的终点，
/// 而不是按部就班的 -=1
public class BubbleSort3<E: Comparable>: Sorter<E> {
    public override func sort() {
        var end = array.length - 1
        while (end > 0) {
            var selectedIndex: Int?
            for k in 0..<end {
                if isGreater(k, k + 1) {
                    swap(k, k + 1)
                    selectedIndex = k
                }
            }
            if let selectedIndex = selectedIndex {
                end = selectedIndex
            } else {
                end -= 1
            }
        }
    }
}
