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

let node0 = ListNode(val: 0, next: nil)
let node1 = ListNode(val: 1, next: nil)
let node2 = ListNode(val: 2, next: nil)
let node3 = ListNode(val: 3, next: nil)
let node4 = ListNode(val: 4, next: nil)
node0.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
//node4.next = node1

print(Solution.hasCycle(node0))

func testRemoveElements(_ foo: (ListNode?, Int) -> ListNode?) {
    let list1 = Helper.buildList(from: [1,2,6,3,4,5,6])
    let ret1 = foo(list1, 6)
    print("ret1", Helper.printedAsList(ret1))
    
    let list2 = Helper.buildList(from: [])
    let ret2 = foo(list2, 6)
    print("ret2", Helper.printedAsList(ret2))
    
    let list3 = Helper.buildList(from: [7, 7, 7, 7])
    let ret3 = foo(list3, 7)
    print("ret3", Helper.printedAsList(ret3))
}

func testDeleteDuplicateElements(_ foo: (ListNode?) -> ListNode?) {
    let list1 = Helper.buildList(from: [1, 2, 3, 3, 4, 5, 6, 6])
    let ret1 = foo(list1)
    print("ret1", Helper.printedAsList(ret1))
    
    let list2 = Helper.buildList(from: [])
    let ret2 = foo(list2)
    print("ret2", Helper.printedAsList(ret2))
    
    let list3 = Helper.buildList(from: [7, 7, 7, 7])
    let ret3 = foo(list3)
    print("ret3", Helper.printedAsList(ret3))
}

Helper.printSep()
testRemoveElements(Solution.removeElements)
Helper.printSep()
testRemoveElements(Solution.removeElements2)
Helper.printSep()
testRemoveElements(Solution.removeElements3)

Helper.printSep()
testDeleteDuplicateElements(Solution.deleteDuplicates)
Helper.printSep()
testDeleteDuplicateElements(Solution.deleteDuplicates2)


