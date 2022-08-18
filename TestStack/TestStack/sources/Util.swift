//
//  File.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation


public extension CustomStringConvertible {
    func printed() {
        print(self)
    }
}

public extension Bool {
    func assertTrue() {
        assert(self == true)
    }
    
    func assertFalse() {
        assert(self == false)
    }
}

public extension Int {
    func times(_ work: () -> Void) {
        for _ in 0..<self {
            work()
        }
    }
    
    func enumerate(_ work: (Int) -> Void) {
        for i in 0..<self {
            work(i)
        }
    }
}
