import Foundation


public class Helper {
    public static func printedAsList(_ node: ListNode?) -> String {
        if node == nil {
            return "null"
        }
        
        var node = node
        var string = ""
        string += "["
        while node != nil {
            string += "\(node?.val ?? 0)"
            if node?.next != nil {
                string += ", "
            }
            node = node?.next
        }
        
        string += "]"
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
    
    static func printSep(_ msg: String = "") {
        print("--------- \(msg) ---------------------------------")
    }
}
