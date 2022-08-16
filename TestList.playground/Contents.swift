import Cocoa


let link = LinkedList<Int>()
link.add(5)
assert(link.getElement(0) == 5)
assert(link.getSize() == 1)

link.add(6)
assert(link.getElement(1) == 6)
assert(link.getSize() == 2)

link.remove(1)
assert(link.getSize() == 1)
assert(link.getElement(0) == 5)

let node = Helper.buildList(from: [2, 3, 4, 5])
Helper.printedAsList(node)

let reversed = Solution.reverseList(node)
Helper.printedAsList(reversed)
