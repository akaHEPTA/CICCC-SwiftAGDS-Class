//
//  Evaluate.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-13.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func evaluate(_ string: String) -> Int {
    guard string.contains("+") || string.contains("*") && string.contains("(") && string.contains(")") else {
        return Int(string)!
    }
    var math = string
    
    let first = math.lastIndex(of: "(")!
    let last = math[first...].firstIndex(of: ")")!
    
    var substr = String(math[first...last])
    substr = String(substr.dropFirst())
    substr = String(substr.dropLast())
    
    let (op, a, b) = extract(substr)!
    if op == "+"{
        math.replaceSubrange(first...last, with: String(a+b))
    } else if op == "*" {
        math.replaceSubrange(first...last, with: String(a*b))
    }
    return evaluate(math)
    
}

func extract(_ input: String) -> (op: String, a: Int, b: Int)? {
    if let op = input.firstIndex(of: "+") {
        let a = Int(input[input.startIndex..<op])!
        let b = Int(input[op..<input.endIndex].dropFirst())!
        return (String(input[op]), a, b)
    } else if let op = input.firstIndex(of: "*") {
        let a = Int(input[input.startIndex..<op])!
        let b = Int(input[op..<input.endIndex].dropFirst())!
        return (String(input[op]), a, b)
    }
    return nil
}
