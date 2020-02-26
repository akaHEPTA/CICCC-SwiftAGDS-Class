//
//  Recursion.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-11.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

// 1. power(base, exponent): base^exponent
// Assume exponent >= 0
func power(_ base: Int, _ exponent: Int) -> Int {
    // base case
    guard exponent > 0 else { return 1 }
    // recursive case
    return base * power(base, exponent - 1)
}

// 2. isPalindrome(word): check if a word is palindrome
// racecar -> true, hello -> false
func isPalindrome(_ word: String) -> Bool {
    // base case
    guard word.count > 1 else { return true }
    // recursive case
    if let first = word.first, let last = word.last, first == last {
        return isPalindrome(word[1, word.count - 1])
    }
    return false
}

// 3. printBinary(Int) -> Void: print binary form of given int input
func printBinary(_ num: Int) {
    if num < 0 {
        print("-", terminator: "")
        printBinary(-num)
        return
    }
    // base case
    if num < 2 {
        print(num, terminator: "")
        return
    }
    // recursive case
    printBinary(num / 2)
    print(num % 2, terminator: "")
}

// 4. reverseLines
// - Print all lines in reverse order (recursion) from a text file
// - You can change the function header if you want.

//func reverseLines(_ line: Int) {
//    let content = try? String(contentsOfFile: "/Users/Ricky/Workspace/XcodeProjects/SwiftAlgorithmsDataStructures/SwiftAlgorithmsDataStructures/Recursion/story.txt", encoding: .utf8)
//    //    let lines = content?.split(separator: "\n")
//    
//}


