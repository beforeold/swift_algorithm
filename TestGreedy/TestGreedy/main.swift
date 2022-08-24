//
//  main.swift
//  TestGreedy
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

print("Hello, World!")

print(Greedy.maxItemCount(capacity: 10, itemWeights: [1, 2, 4, 5, 8]))
print(Greedy.maxItemCount(capacity: 10, itemWeights: [1, 2, 3, 5, 9]))

print(Greedy.minCoinsCount(change: 41, faces: [5, 1, 20]) ?? -1)
print(Greedy.minCoinsCount(change: 41, faces: [5, 1, 20, 25]) ?? -1)
