//
//  _121_买卖股票的最佳时机.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/

class Solution121 {
  
}

extension Solution121 {
  class S1 {
    class Solution {
      func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for price in prices {
          if price < minPrice {
            minPrice = price
          } else {
            let curProfit = price - minPrice
            maxProfit = max(maxProfit, curProfit)
          }
        }
        
        return maxProfit
      }
    }
  }
}
