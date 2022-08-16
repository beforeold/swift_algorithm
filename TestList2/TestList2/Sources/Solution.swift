import Foundation


public class Solution {
    /// leetcode 反转链表
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
    
    /// leetcode 反转链表
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
    
    /// leet code 删除链表节点
    /// https://leetcode.cn/problems/delete-node-in-a-linked-list/
    /// 核心是不移动 node，而是移动 node 的数据
    public static func deleteNode(_ node: ListNode?) {
        node?.val = node?.next?.val ?? 0
        node?.next = node?.next?.next
    }
    
    /// leetcode 环形链表
    /// https://leetcode.cn/problems/linked-list-cycle/
    /// 核心是利用快慢指针，判断是否有相遇，直到结束
    public static func hasCycle(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return false
        }
        
        var slow = head
        var fast = head?.next
        
        while (fast != nil && fast?.next != nil) {
            if slow === fast {
                return true
            }
            
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}
