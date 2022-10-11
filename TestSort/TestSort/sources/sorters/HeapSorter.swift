//
//  HeapSorter.swift
//  TestSort
//
//  Created by beforeold on 2022/10/11.
//

import Foundation

struct HeapSorter<E: Comparable> {
  /// 通过原地建堆后，不断将堆顶交换到尾部，再回复前部分的堆特点，循环执行
  ///
  /// - Complexity: O(nlogn)
  static func sort(_ array: inout [E]) {
    heapify(&array)
    
    var size = array.count
    while size > 1 {
      array.swapAt(0, size - 1)
      
      size -= 1
      siftDown(0, array: &array, size: size)
    }
  }
  
  /// 原地建堆，进行自下而上的下滤
  ///
  /// half 是前半部分非叶子结点的个数
  ///
  /// - Complexity: O(n)
  private static func heapify(_ array: inout [E]) {
    let size = array.count
    let half = size / 2
    for i in (0..<half).reversed() {
      siftDown(i, array: &array, size: size)
    }
  }
  
  /// 将非叶子结点进行下滤
  ///
  /// - Complexity: O(logn)
  private static func siftDown(_ index: Int,
                               array: inout [E],
                               size: Int) {
    let iValue = array[index]
    var index = index
    
    // 完全二叉树性质：计算最小非叶子结点的个数
    // 只有非叶子结点需要下滤
    let half = size / 2
    
    while index < half {
      // 由于右子结点可能不存在，所以先默认赋值为左子结点, 再判断右子树是否可能为更大值
      var childIndex = 2 * index + 1
      var childValue = array[childIndex]
      
      let rightIndex = childIndex + 1
      if rightIndex < size {
        let rightValue = array[rightIndex]
        if rightValue > childValue {
          childIndex = rightIndex
          childValue = rightValue
        }
      }
      
      if iValue > childValue { break }
      
      array[index] = childValue
      index = childIndex
    }
    
    array[index] = iValue
  }
}
