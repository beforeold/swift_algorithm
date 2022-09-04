//
//  _169_多数元素.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/4.
//

import Foundation

// https://leetcode.cn/problems/majority-element/

class Solution169 {
  
}

extension Solution169 {
  class S1 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        
        for num in nums {
          let count = (map[num] ?? 0) + 1
          map[num] = count
        }
        
        var max = (num: -1, count: -1)
        for (num, count) in map {
          if count > max.count {
            max = (num, count)
          }
        }
        
        if max.count > nums.count / 2 {
          return max.num
        }
        return -1
      }
    }
  }
}

extension Solution169 {
  class S1_1 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        var map = [Int: Int]()
        let n = nums.count
        
        for num in nums {
          let count = (map[num] ?? 0) + 1
          if count > n / 2 {
            return num
          }
          
          map[num] = count
        }
        
        return -1
      }
    }
  }
}


extension Solution169 {
  /// 先排序，后取值
  class S2 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        return nums[nums.count / 2]
      }
    }
  }
}

extension Solution169 {
  /// 随机处理
  class S3 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        let majCount = nums.count / 2
        
        func count(of candidate: Int) -> Int {
          return nums.reduce(0) { partialResult, num in
            if num == candidate {
              return partialResult + 1
            } else {
              return partialResult
            }
          }
        }
        
        var randomeGenerator = SystemRandomNumberGenerator()
        
        while true {
          let random = nums.randomElement(using: &randomeGenerator)!
          if count(of: random) > majCount {
            return random
          }
        }
      }
    }
  }
}


extension Solution169 {
  class S4 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        return major(nums: nums, low: 0, high: nums.count - 1)
      }
      
      private func major(nums: [Int], low: Int, high: Int) -> Int {
        if low == high {
          return nums[low]
        }
        
        let mid = (high - low) / 2 + low
        let left = major(nums: nums, low: low, high: mid)
        let right = major(nums: nums, low: mid + 1, high: high)
        
        if left == right {
          return left
        }
        
        let leftCount = count(of: left, nums: nums, low: low, high: mid)
        let rightCount = count(of: right, nums: nums, low: mid + 1, high: high)
        return leftCount > rightCount ? left : right
      }
      
      private func count(of num: Int, nums: [Int], low: Int, high: Int) -> Int {
        var count = 0
        for index in low...high {
          if num == nums[index] {
            count += 1
          }
        }
        return count
      }
    }
  }
}


extension Solution169 {
  /// boyer moore 算法
  /// https://leetcode.cn/problems/majority-element/solution/duo-shu-yuan-su-by-leetcode-solution/
  class S5 {
    class Solution {
      func majorityElement(_ nums: [Int]) -> Int {
        var candidate: Int?
        var count = 0
        
        for x in nums {
          if count == 0 {
            candidate = x
          }
          if x == candidate {
            count += 1
          } else {
            count -= 1
          }
        }
        
        let ret = candidate ?? -1
        return ret
      }
    }
  }
}

extension Solution169.S3 {
  static func test() {
    let ret = Solution().majorityElement([5, 1, 0, 5, 2, 5, 4, 4, 5, 5, 5])
    print("maj ret: \(ret)")
    assert(ret == 5)
  }
}
