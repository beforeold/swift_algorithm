

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
