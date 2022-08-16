import Foundation


public class Solution {
    /// leetcode
    /// https://leetcode.cn/problems/reverse-linked-list-ii/
    /// 递归方法
    /// 核心是通过局部反转后推导整体反转的逻辑
    public static func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        
        let newHead = reverseList(head?.next)
        
        let tail = head?.next
        tail?.next = head
        head?.next = nil
        
        return newHead
    }
    
    /// leetcode
    /// https://leetcode.cn/problems/reverse-linked-list-ii/
    /// 迭代方法
    /// 核心是新建一个链表，逐个将元素倒置转移过去
    public static func reversList2(_ head: ListNode?) -> ListNode? {
        if head?.next == nil {
            return head
        }
        
        var head = head
        var newHead: ListNode?
        
        while head != nil {
            let nextHead = head?.next
            head?.next = newHead
            newHead = head
            head = nextHead
        }
        
        return newHead
    }
    
    /// leet code
    /// https://leetcode.cn/problems/delete-node-in-a-linked-list/
    /// 核心是不移动 node，而是移动 node 的数据
    public static func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
}
