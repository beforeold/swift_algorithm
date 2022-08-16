

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

public class Solution {
    public static func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        if head?.next == nil { return head }
        
        let newHead = reverseList(head?.next)
        let tail = head?.next
        tail?.next = head
        head?.next = nil
        
        return newHead
    }
    
    public static func reversList2(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        if head?.next == nil { return head }
        
        var head = head
        var newHead: ListNode?
        
        while (head != nil) {
            // save next head
            let nextHead = head?.next
            
            // change new head
            head?.next = newHead
            newHead = head
            
            // change head
            head = nextHead
        }
        
        return newHead
    }
}
