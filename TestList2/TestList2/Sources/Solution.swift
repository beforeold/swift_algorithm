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
    
    /// leetcode 删除链表节点
    /// https://leetcode.cn/problems/remove-linked-list-elements/
    /// 移动节点删除
    static func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyHead = ListNode()
        dummyHead.next = head
        
        var prev: ListNode? = dummyHead
        var cur = prev?.next
        
        while (cur != nil) {
            if cur?.val == val {
                prev?.next = cur?.next
                cur = cur?.next
            } else {
                prev = cur
                cur = cur?.next
            }
        }
        
        return dummyHead.next
    }
    
    /// leetcode 删除链表节点
    /// https://leetcode.cn/problems/remove-linked-list-elements/
    ///  修改节点内容删除，注意是使用 next 来进行判断，而不是 cur，否则会导致结尾时无法删除自身
    static func removeElements2(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummyHead = ListNode()
        dummyHead.next = head
        
        var cur: ListNode? = dummyHead
        while (cur?.next != nil) {
            if (cur?.next?.val == val) {
                cur?.next = cur?.next?.next
                
            } else {
                cur = cur?.next
            }
        }
        
        return dummyHead.next
    }
    
    /// leetcode 删除链表节点
    /// https://leetcode.cn/problems/remove-linked-list-elements/
    ///  递归
    static func removeElements3(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        head?.next = removeElements3(head?.next, val)
        return head?.val == val ? head?.next : head
    }
    
    /// 删除排序链表中的重复元素
    /// https://leetcode.cn/problems/remove-duplicates-from-sorted-list/
    /// 递归
    public static func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }
        
        head?.next = deleteDuplicates(head?.next)
        return head?.val == head?.next?.val ? head?.next : head
    }
}
