import Cocoa


let array = ArrayList<Int>()
array.add(5)
assert(array.getElement(0) == 5)
assert(array.getSize() == 1)
array.remove(0)
assert(array.getSize() == 0)
array

array.add(77)
array.add(77)
array.add(77)
array.add(77)
array.add(77)
array.add(77)
array.add(77)
array.getSize()
array.add(0, 33)
array.getSize()
array.add(8, 99)
