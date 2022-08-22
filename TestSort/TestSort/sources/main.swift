//
//  main.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation
import DataStructure


func testStaticArray() {
    let sa = StaticArray(initial: [3, 2, 1, nil, nil])
    print(sa)
}

func testFullStaticArray() {
    let initial = FullStaticArray([5, 3, 4, 1, 2])
    print(initial)
}

func testBubbleSort(array: [Int]) {
    let input = FullStaticArray(array)
    print("initial ", input)
    
    let bubble1 = BubbleSort1(input.copy())
    print("bubble1 ", bubble1)
    
    let bubble2 = BubbleSort2(input.copy())
    print("bubble2 ", bubble2)
    
    let bubble3 = BubbleSort3(input.copy())
    print("bubble3 ", bubble3)
    
    let bubble4 = BubbleSort3(.init([8, 10, 3, 5, 6]))
    print("bubble4 ", bubble4)
}

testBubbleSort(array: [5, 4, 2, 1, 3, 8])
