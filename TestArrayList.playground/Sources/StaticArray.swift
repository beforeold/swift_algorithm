import Foundation

public class StaticArray<E: Equatable> {
    private var _buffer: [E?]
    
    public init(length: Int) {
        _buffer = (0..<length).map { _ in
            nil
        }
    }
    
    public var length: Int {
        return _buffer.count
    }
    
    public subscript(_ index: Int) -> E? {
        set {
            _buffer[index] = newValue
        }
        
        get {
            return _buffer[index]
        }
    }
}
