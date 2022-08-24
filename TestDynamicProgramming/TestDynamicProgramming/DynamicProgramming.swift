//
//  DynamicProgramming.swift
//  TestDynamicProgramming
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

public class DynamicProgramming {
    public static func minCoinsCount1(change: Int,
                                      faces: [Int]) -> Int {
        if change <= 0 || faces.count == 0 { return -1 }
        
        if faces.contains(change) { return 1 }
        
        var minCount = Int.max
        for face in faces {
            let count = minCoinsCount1(change: change - face, faces: faces)
            if count != -1 {
                minCount = min(count, minCount)
            }
        }
        
        if minCount == Int.max {
            return -1
        } else {
            return minCount + 1
        }
    }
    
    public static func minCoinsCount2(change: Int,
                                      faces: [Int]) -> Int {
        if change <= 0 || faces.count == 0 { return -1 }
        let length = max(change, faces.max()!) + 1
        var dp = Array<Int>(repeating: 0, count: length)
        for face in faces {
            dp[face] = 1
        }
        
        return minCoinsCount2(change: change,
                              faces: faces,
                              dp: &dp)
    }
    
    public static func minCoinsCount3(change: Int,
                                      faces: [Int]) -> Int {
        if change <= 0 || faces.count == 0 { return -1 }
        
        let length = max(change, faces.max()!) + 1
        var dp = Array<Int>(repeating: 0, count: length)
        for face in faces {
            dp[face] = 1
        }
        
        for i in 1...change {
            var minCount = Int.max
            for face in faces {
                guard i >= face else { continue }
                let count = dp[i - face]
                if count >= 0 {
                    minCount = min(minCount, count)
                }
            }
            
            if minCount == Int.max {
                dp[i] = -1
            } else {
                dp[i] = minCount + 1
            }
        }
        
        return dp[change]
    }
    
    private static func minCoinsCount2(change: Int,
                                      faces: [Int],
                                      dp: inout [Int]) -> Int {
        if dp[change] > 0 {
            return dp[change]
        }
        
        var minCount = Int.max
        for face in faces {
            let count = minCoinsCount1(change: change - face, faces: faces)
            if count > 0 {
                minCount = min(count, minCount)
            }
        }
        
        if minCount == Int.max {
            return -1
        } else {
            dp[change] = minCount + 1
        }
        
        return dp[change]
    }
}
