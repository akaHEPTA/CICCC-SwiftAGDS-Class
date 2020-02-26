//
//  Evaluate2.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-14.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

// Without String Helper Extension
func evaluateHelper(_ expr: String, _ i: inout String.Index) -> Int {
    if expr[i].isNumber {
        return Int(String(expr[i]))!
    } else {
        i = expr.index(after: i)
        let leftExpr = evaluateHelper(expr, &i)
        i = expr.index(after: i)
        let op = String(expr[i])
        i = expr.index(after: i)
        let rightExpr = evaluateHelper(expr, &i)
        i = expr.index(after: i)
        if op == "+" {
            return leftExpr + rightExpr
        } else {
            return leftExpr * rightExpr
        }
    }
}

func evaluate2(_ expr: String) -> Int {
    var i = expr.startIndex
    return evaluateHelper(expr, &i)
}

// With String Helper Extension (String+DPStringTool.swift)
//func evaluateHelperWExt(_ expr: String, _ index: inout Int) -> Int {
//    if Character(expr[index]).isNumber {
//        return Int(expr[index])!
//    } else {
//        index += 1 // skip (
//        let left = evaluateHelper(expr, &index)
//        index += 1
//        let op = expr[index] // +, *
//        index += 1
//        let right = evaluateHelper(expr, &index)
//        index += 1 // skip )
//        if op == "+" {
//            return left + right
//        } else {
//            return left * right
//        }
//    }
//}
//
//func evaluateWExt(_ expr: String) -> Int {
//    var i = 0
//    return evaluateHelper(expr, &i)
//}
