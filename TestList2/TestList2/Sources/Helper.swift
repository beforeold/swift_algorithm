import Foundation


public class Helper {
    public static func printedAsList(_ node: ListNode?) -> String {
        var node = node
        var string = ""
        
        while node != nil {
            string += "\(node?.val ?? 0), "
            node = node?.next
        }
        
        return string
    }
    
    public static func buildList(from array: [Int]) -> ListNode? {
        var node: ListNode?
        var first: ListNode?
        
        for val in array {
            let newNode = ListNode(val: val, next: nil)
            if node == nil {
                first = newNode
                node = newNode
            } else {
                node?.next = newNode
                node = newNode
            }
        }
        
        return first
    }
}
