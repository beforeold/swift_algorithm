//
//  TreeNode.swift
//  TestBinarySearchTree
//
//  Created by Brook16 on 2022/8/17.
//

import Foundation


public class TreeNode<Element: Comparable>: CustomDebugStringConvertible {
    public var left: TreeNode<Element>?
    public var right: TreeNode<Element>?
    
    /// 注意：这里必须使用弱指针，否则调用clear的时候，root置位nil，其他节点不会销毁
    public weak var parent: TreeNode?
    
    public var height: Int = 1
    
    public var element: Element
    
    public var val: Element {
        get {
            return self.element
        }
        set {
            self.element = newValue
        }
    }
    
    public var isLeaf: Bool {
        return (left == nil && right == nil)
    }
    
    public var hasTowChildren: Bool {
        return (left != nil && right != nil)
    }
    
    public init(_ val: Element) {
        self.element = val;
        self.left = nil;
        self.right = nil;
    }
    
    public init(_ val: Element,
                _ left: TreeNode?,
                _ right: TreeNode?)
    {
        self.element = val
        self.left = left
        self.right = right
    }
    
    public init(element: Element, parent: TreeNode?) {
        self.element = element
        self.parent = parent
    }
    
    deinit {
       
    }
    
    public var debugDescription: String {
        if let parentElement = parent?.element {
            return "\(element)(\(parentElement))"
        }else {
            return "\(element)"
        }
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return Unmanaged.passRetained(lhs).toOpaque() == Unmanaged.passRetained(rhs).toOpaque()
        // return lhs.element == rhs.element
    }
}
