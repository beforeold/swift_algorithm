//
//  _88_合并两个有序数组.swift
//  TestLeetCode
//
//  Created by beforeold on 2022/9/1.
//

import Foundation

// https://leetcode.cn/problems/merge-sorted-array/solution/
class Solution88 {
  class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
      if m == 0 {
        nums1 = nums2
        return
      }
      
      if n == 0 {
        return
      }
      
      var m = m
      var p1 = 0
      var p2 = 0
      
      while (m > p1 && n > p2) {
        let v1 = nums1[p1]
        let v2 = nums2[p2]
        print("p1: \(p1)~ \(v1), p2: \(p2)~\(v2)")
        
        if v2 < v1 {
          // insert here
          nums1.insert(v2, at: p1)
          p1 += 1
          p2 += 1
          m += 1
          // remove last zero
          nums1.removeLast()
        } else {
          // search next position for inserting
          p1 += 1
        }
      }
      
      // move left elements
      for i in p2..<n {
        let value = nums2[i]
        nums1[p1] = value
        p1 += 1
      }
    }
  }
  
  static func test() {
    var nums1 = [3, 6, 8]
    let m = nums1.count
    let nums2 = [4, 5, 10, 11]
    let n = nums2.count;
    
    // add zero
    nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
    
    Solution().merge(&nums1, m, nums2, n)
    assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
  }
}

extension Solution88 {
  class S2 {
    class Solution {
      // 作者：kaijiemu
      // 链接：https://leetcode.cn/problems/merge-sorted-array/solution/by-kaijiemu-6mlz/
      // 来源：力扣（LeetCode）
      // 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
      func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var end1 = m - 1 //nums1 右坐标
        var end2 = n - 1 //nums2 右坐标
        var position = m + n - 1 // 从最右边开始存放数据
        
        while 0 <= end2 {
          if 0 <= end1 && nums1[end1] > nums2[end2] {
            nums1[position] = nums1[end1]
            position -= 1
            end1 -= 1
          } else {
            nums1[position] = nums2[end2]
            position -= 1
            end2 -= 1
          }
        }
      }
    }
    
    static func test() {
      func test1() {
        var nums1 = [3, 6, 8]
        let m = nums1.count
        let nums2 = [4, 5, 10, 11]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
      }
      
      func test2() {
        var nums1 = [2]
        let m = nums1.count
        let nums2 = [1]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2])
      }
      
      func test3() {
        var nums1 = [1, 2, 3]
        let m = nums1.count
        let nums2 = [2, 5, 6]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2, 2, 3, 5, 6])
      }
      
      test1()
      test2()
      test3()
    }
  }
}

extension Solution88 {
  class S3 {
    class Solution {
      /// 思路：目标是将 nums2 合并到 nums1，
      /// 由于末尾是0，所以采用从末尾开始处理，
      /// 遍历所有 nums2 元素，就是 while 循环的判断条件
      /// 当 nums1 未完成时进行比较，大的插入到尾部，指针移动
      /// 直到遍历 end1 和 end2 完成，这里的条件设置十分巧妙
      func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var end1 = m - 1
        var end2 = n - 1
        var position = m + n - 1
        
        while end2 >= 0 {
          if end1 >= 0 && nums1[end1] > nums2[end2] {
            nums1[position] = nums1[end1]
            end1 -= 1
          } else {
            nums1[position] = nums2[end2]
            end2 -= 1
          }
          position -= 1
        }
      }
    }
    
    static func test() {
      func test1() {
        var nums1 = [3, 6, 8]
        let m = nums1.count
        let nums2 = [4, 5, 10, 11]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
      }
      
      func test2() {
        var nums1 = [2]
        let m = nums1.count
        let nums2 = [1]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2])
      }
      
      func test3() {
        var nums1 = [2]
        let m = nums1.count
        let nums2 = [1]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2])
      }
    }
  }
}

extension Solution88 {
  // Wrong
  class S4 {
    class Solution {
      func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var len1 = m - 1;
        var len2 = n - 1;
        var len = m + n - 1;
        while (len1 >= 0 && len2 >= 0) {
          // 注意--符号在后面，表示先进行计算再减1，这种缩写缩短了代码
          if nums1[len1] > nums2[len2] {
            nums1[len] = nums1[len1]
            len1 -= 1
          } else {
            nums1[len] = nums2[len2]
            len2 -= 1
          }
          len -= 1
        }
      }
    }
    
    static func test() {
      var nums1 = [3, 6, 8]
      let m = nums1.count
      let nums2 = [4, 5, 10, 11]
      let n = nums2.count;
      
      // add zero
      nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
      
      Solution().merge(&nums1, m, nums2, n)
      assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
      
      
      func test2() {
        var nums1 = [2]
        let m = nums1.count
        let nums2 = [1]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2])
      }
      
      func test3() {
        var nums1 = [2]
        let m = nums1.count
        let nums2 = [1]
        let n = nums2.count;
        
        // add zero
        nums1.append(contentsOf: Array<Int>(repeating: 0, count: n))
        
        Solution().merge(&nums1, m, nums2, n)
        assert(nums1 == [1, 2])
      }
      
      test2()
      test3()
    }
  }
}


extension Solution88 {
  // Wrong
  class S5 {
    class Solution {
      func merge(_ nums1: inout [Int], _ nums2: [Int]) {
        // setup for merge (add zero for nums2
        let m = nums1.count
        let n = nums2.count
        nums1.append(contentsOf: [Int](repeating: 0, count: n))
        
        var end1 = m - 1
        var end2 = n - 1
        var position = m + n - 1
        while end2 >= 0 {
          if end1 >= 0 && nums1[end1] > nums2[end2] {
            nums1[position] = nums1[end1]
            end1 -= 1
          } else {
            nums1[position] = nums2[end2]
            end2 -= 1
          }
          position -= 1
        }
      }
    }
    
    static func test() {
      var nums1 = [3, 6, 8]
      let nums2 = [4, 5, 10, 11]
      
      Solution().merge(&nums1, nums2)
      assert(nums1 == [3, 4, 5, 6, 8, 10, 11])
      
      
      func test2() {
        var nums1 = [2]
        let nums2 = [1]
        
        Solution().merge(&nums1, nums2)
        assert(nums1 == [1, 2])
      }
      
      func test3() {
        var nums1 = [2]
        let nums2 = [1]
        
        Solution().merge(&nums1, nums2)
        assert(nums1 == [1, 2])
      }
      
      test2()
      test3()
    }
  }
}
