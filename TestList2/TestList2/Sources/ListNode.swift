

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        let nextDesc: String
        if let next = next {
            nextDesc = "\(next.val)"
        } else {
            nextDesc = "null"
        }
        return "\(val)_\(nextDesc)"
    }
}
