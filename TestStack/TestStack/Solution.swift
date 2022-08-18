//
//  Solution.swift
//  TestStack
//
//  Created by Brook16 on 2022/8/18.
//

import Foundation

public class Solution {
    public static func browser() {
        let browser = Browser()
        
        func peak() {
            print("\n")
            print(browser.peak() ?? "null")
            print(browser)
            print("\n")
        }
        
        browser.push("qq")
        peak()
        
        browser.push("baidu")
        peak()
        
        browser.push("google")
        peak()
        
        browser.pop()
        peak()
        
        browser.forward()
        peak()
        
        browser.push("jd")
        peak()
        
        // browser.forward()
    }
}
