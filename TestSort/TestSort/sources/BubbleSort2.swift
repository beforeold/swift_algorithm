//
//  BubbleSort2.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation

/// 优化 BubbleSort1，在某一轮循环中发现没有交换，则认定排序完成，提前退出 break
public class BubbleSort2<E: Comparable>: Sorter<E> {
    public override func sort() {
        for i in 0..<array.length {
            var isOrdered = true
            let end = array.length - i - 1
            for k in 0..<end {
                if isGreater(k, k + 1) {
                    swap(k, k + 1)
                    isOrdered = false
                }
            }
            
            if isOrdered { break }
        }
    }
}
