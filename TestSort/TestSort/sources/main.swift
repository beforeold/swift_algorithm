//
//  main.swift
//  TestSort
//
//  Created by Brook16 on 2022/8/22.
//

import Foundation
import DataStructure


let sa = StaticArray(initial: [3, 2, 1, nil, nil])
print(sa)

let initial = FullStaticArray(initial: [5, 3, 4, 1, 2])
print(initial)

let bubble1 = BubbleSort1(array: initial)
print(bubble1)

