//
//  main.swift
//  TestList2
//
//  Created by Brook16 on 2022/8/16.
//

import Foundation


let link = LinkedList<Int>()
link.add(5)
assert(link.getElement(0) == 5)
assert(link.getSize() == 1)

link.add(6)
assert(link.getElement(1) == 6)
assert(link.getSize() == 2)

_ = link.remove(1)
assert(link.getSize() == 1)
assert(link.getElement(0) == 5)

let node = Helper.buildList(from: [1, 2, 3, 4, 5])
print(Helper.printedAsList(node))

let reversed = Solution.reverseList(node)
print(Helper.printedAsList(reversed))

let reversed2 = Solution.reversList2(reversed)
print(Helper.printedAsList(reversed2))


let head = Helper.buildList(from: [777, 888, 999])
print(Helper.printedAsList(head))
let _888 = head?.next
Solution.deleteNode(_888)
print(Helper.printedAsList(head))


