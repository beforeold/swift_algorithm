//
//  Greedy.swift
//  TestGreedy
//
//  Created by BrookXy on 2022/8/24.
//

import Foundation

public class Greedy {
  /// maxCount of weight
  public static func maxItemCount(capacity: Int, itemWeights: [Int]) -> Int {
    let weights = itemWeights.sorted(by: >)
    var count = 0
    var left = capacity
    
    for weight in weights {
      if left > weight {
        count += 1
        left -= weight
      } else {
        break
      }
    }
    
    return count
  }
  
  public static func minCoinsCount(change: Int,
                                   faces: [Int]) -> Int? {
    var left = change
    var count = 0
    let faces = faces.sorted(by: >)
    
    for _ in 0..<change {
      if left == 0 { break }
      
      var changed = false
      
      for face in faces {
        if left >= face {
          changed = true
          left -= face
          count += 1
          break
        } else {
          continue
        }
      }
      
      if !changed {
        return nil
      }
    }
    
    return count
  }
}
