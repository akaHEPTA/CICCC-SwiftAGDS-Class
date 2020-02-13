//
//  Searching.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-10.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

// "option + command + /" -> shortcut for DocString

/// Linear Search Algorithm
/// Returns the index of the given target value from the collection.
/// otherwise, -1
/// O(n)
/// - Parameters:
///   - collection: an array of integers
///   - target: search target
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
    for (index, element) in collection.enumerated() where element == target {
        return index
    }
    return nil
}

/// Binary Search Algorithm
/// Returns the index of the given target value from the collection.
/// otherwise, -1
/// O(lg N)
/// - Parameters:
///   - collection: an array of integers
///   - target: search target
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
    let collection = collection.sorted()
    
    var lower: Int = 0
    var upper: Int = collection.count - 1
    
    while lower < upper {
        let index = lower + upper / 2
        if collection[index] == target {
            return index
        } else if collection[index] < target {
            lower = index + 1
        } else if collection[index] > target {
            upper = index - 1
        }
    }
    return nil
}


