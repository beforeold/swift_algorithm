import Foundation

public class LinkedList<E: Equatable>: List {
    
    public class Node {
        var element: E?
        var next: Node?
        
        init(element: E?, next: Node?) {
            self.element = element
            self.next = next
        }
    }
    
    public var first: Node?
    
    private var size: Int = 0
    
    public init() {
        
    }
    
    public func getSize() -> Int {
        return size
    }
    
    public func getElement(_ index: Int) -> E? {
        return node(at: index)?.element
    }
    
    public func set(_ index: Int, _ element: E?) -> E? {
        let node = node(at: index)
        let oldElement = node?.element
        
        node?.element = element
        
        return oldElement
    }
    
    public func add(_ index: Int, _ element: E?) {
        if index == 0 {
            let newNode = Node(element: element, next: first)
            first = newNode
        } else {
            rangeCheck(index, forAdd: true)
            let prev = node(at: index - 1)
            let newNode = Node(element: element, next: prev?.next)
            prev?.next = newNode
        }
        
        size += 1
    }
    
    public func remove(_ index: Int) -> E? {
        var old: E?
        if index == 0 {
            old = first?.element
            first = first?.next
        } else {
            let prev = node(at: index - 1)
            let node = prev?.next
            old = node?.element
            prev?.next = node?.next
        }
        
        size -= 1
        
        return old
    }
    
    public func indexOf(_ element: E?) -> Int? {
        var node = first
        var index = 0
        while node != nil {
            if node?.element == element {
                return index
            }
            
            node = node?.next
            index += 1
        }
        
        return nil
    }
    
    private func rangeCheck(_ index: Int, forAdd: Bool) {
        let limit = forAdd ? size : size - 1
        precondition(index >= 0 && index <= limit, "Out of bounds, index: \(index), limit: \(limit)")
    }
    
    private func node(at index: Int) -> Node? {
        rangeCheck(index, forAdd: false)
        
        var node = first
        for _ in 0..<index {
            node = node?.next
        }
        
        return node
    }
    
    public func clear() {
        first = nil
        size = 0
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        var string = ""
        string += "["
        var node = first
        
        while node != nil {
            if node !== first {
                string += " ,"
            }
            
            if let element = node?.element {
                string += "\(element)"
            } else {
                string += "null"
            }
            
            node = node?.next
        }
        string += "]"
        
        return string
    }
}
