import Foundation

enum ListError {
    case outOfBounds
}

public protocol List {
    associatedtype E: Equatable
    
    func getSize() -> Int
    
    func isEmpty() -> Bool
    
    func contains(_ element: E?) -> Bool
    
    func add(_ element: E?)
    
    func getElement(_ index: Int) -> E?
    
    func set(_ index: Int, _ element: E?) -> E?
    
    /// 插入元素
    func add(_ index: Int, _ element: E?)
    
    func remove(_ index: Int) -> E?
    
    func indexOf(_ element: E?) -> Int?
    
    func clear()
}

public extension List {
    func isEmpty() -> Bool {
        return getSize() == 0
    }
    
    func contains(_ element: E?) -> Bool {
        return indexOf(element) != nil
    }
    
    func add(_ element: E?) {
        self.add(getSize(), element)
    }
    
}
