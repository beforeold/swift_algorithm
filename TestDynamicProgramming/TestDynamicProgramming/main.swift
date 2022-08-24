//
//  main.swift
//  TestDynamicProgramming
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

print("Hello, World!")

func testCoins(function: (Int, [Int]) -> Int) {
    // 3
    print(function(41, [1, 5, 20, 25]))
    
    // 7
    print(function(19, [1, 5, 20, 25]))
    
    print(function(19, [20]))
    
    print(function(6, [5]))
    
    print("")
}

testCoins(function: DynamicProgramming.minCoinsCount1)
testCoins(function: DynamicProgramming.minCoinsCount2)
testCoins(function: DynamicProgramming.minCoinsCount3)
