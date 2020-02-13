//
//  ExhaustiveSearch.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-12.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

/// Print all binary number representation with n digits.
/// - Parameter n: the number of digits
func printBinaryExhaustive(_ n: Int, _ prefix: String = "", _ indent: String = "") {
    print("\(indent)\(#function), n = \(n), prefix = \(prefix)")
    if n == 0 {
        // we have no more digits left to choose
        print(prefix)
    } else {
        // we have more decisions to make
        // for each available choices (0 or 1)
        for i in 0..<2 { // choose & search more
            printBinaryExhaustive(n - 1, prefix + "\(i)", indent + "    ")
        }
    }
}

func printDecimal(_ n: Int, _ prefix: String = "") {
    // we have no more digits left to choose
    if n == 0 {
        print(prefix)
    } else {
        // we have more decisions to make
        // for each available choices (0 ~ 9)
        for i in 0...9 { // choose & search more
            printDecimal(n - 1, prefix + "\(i)")
        }
    }
}

func permutations(_ word: String, _ prefix: String = "") {
    // we have no more letters left to choose
    if word.isEmpty {
        print(prefix)
    } else {
        // for each available choices...
        for ch in word {
            var word: String = word
            word.remove(at: word.firstIndex(of: ch)!)
            permutations(word, prefix + "\(ch)")
        }
    }
}
