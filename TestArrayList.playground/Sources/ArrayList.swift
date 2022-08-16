import Foundation

private struct Constant {
    static let defaultCapacity = 10
}

// 不需要处理异常，swift 数组内部会主动抛出
public class ArrayList<E: Equatable> {
    
    private var elements: StaticArray<E>
    
    private var size: Int = 0
    
    public init(capacity: Int = 0) {
        let length =  max(capacity, Constant.defaultCapacity)
        self.elements = StaticArray(length: length)
    }
    
    public func getSize() -> Int {
        return size
    }
    
    public func isEmpty() -> Bool {
        return size == 0
    }
    
    public func contains(_ element: E?) -> Bool {
        for index in 0..<size {
            if elements[index] == element {
                return true
            }
        }
        
        return false
    }
    
    public func add(_ element: E?) {
        self.add(size, element)
    }
    
    public func getElement(_ index: Int) -> E? {
        return elements[index]
    }
    
    public func set(_ index: Int, _ element: E?) -> E? {
        let old = elements[index]
        elements[index] = element
        return old
    }
    
    /// 插入元素
    public func add(_ index: Int, _ element: E?) {
        ensureCapacity(size + 1)
        
        for i in (index..<size).reversed() {
            elements[i + 1] = elements[index]
        }
        elements[index] = element
        size += 1
    }
    
    public func remove(_ index: Int) -> E? {
        for i in (index + 1)..<size {
            elements[i - 1] = elements[i]
        }
        elements[size - 1] = nil
        
        size -= 1
        
        return nil
    }
    
    public func indexOf(_ element: E?) -> Int? {
        for index in 0..<size {
            if elements[index] == element {
                return index
            }
        }
        
        return nil
    }
    
    public func clear() {
        // 到 size 就好，因为 element 其他元素已经清空了
        for i in 0..<size {
            elements[i] = nil
        }
        size = 0
    }
    
    private func ensureCapacity(_ capacity: Int) {
        let oldCapacity = elements.length
        if oldCapacity > capacity {
            return
        }
        let newCapacity = oldCapacity << 1
        let newElements = StaticArray<E>(length: newCapacity)
        for i in 0..<oldCapacity {
            newElements[i] = elements[i]
        }
        elements = newElements
    }
}

extension ArrayList: CustomStringConvertible {
    public var description: String {
        var string = ""
        string += "["
        for i in 0..<size {
            if 0 != i {
                string += ", "
            }
            let element = elements[i]
            if let element = element {
                string += "\(element)"
            } else {
                string += "null"
            }
        }
        string += "]"
        
        return string
    }
}
