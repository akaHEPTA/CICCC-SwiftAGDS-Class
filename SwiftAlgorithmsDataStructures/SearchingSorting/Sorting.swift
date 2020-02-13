//
//  Sorting.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-10.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

// bubble sort O(n^2)
func bubbleSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    var list: [T] = collection
    for i in 0 ..< list.count {
        var swapped = false
        for j in 0 ..< list.count - 1 - i {
            if comparator(list[j + 1], list[j]) {
                list.swapAt(j, j + 1)
                swapped = true
            }
        }
        if swapped == false {
            break
        }
    }
    return list
}

// selection sort O(n^2)
func selectionSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    var list: [T] = collection
    for i in 0 ..< (list.count - 1) {
        var least = i
        for j in (i + 1) ..< list.count {
            if comparator(list[j], list[least]) {
                least = j
            }
        }
        if least != i {
            list.swapAt(least, i)
        }
    }
    return list
}

// insertion sort O(n^2)
func insertionSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    var list: [T] = collection
    for i in 1 ..< list.count {
        var j = i
        let toInsert = list[i]
        while j > 0 && comparator(toInsert, list[j - 1]) {
            list[j] = list[j - 1]
            j -= 1
        }
        list[j] = toInsert
    }
    return list
}

// merge sort O(nlg n) - Divide and Conquer
func mergeSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    let mid = collection.count / 2
    let sortedLeft = mergeSort(Array(collection[0..<mid]), comparator)
    let sortedRight = mergeSort(Array(collection[mid..<collection.count]), comparator)
    
    return merge(sortedLeft, sortedRight, comparator)
}

func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
    var i = 0, j = 0, merged: [T] = []
    while true {
        guard i < left.count else {
            merged.append(contentsOf: right[j..<right.count])
            break
        }
        guard j < right.count else {
            merged.append(contentsOf: left[i..<left.count])
            break
        }
        if comparator(left[i], right[j]) {
            merged.append(left[i])
            i += 1
        } else {
            merged.append(right[j])
            j += 1
        }
    }
    return merged
}

// quick sort
func quickSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    let pivot = collection[collection.count / 2]
    var lesser: [T] = [], equal: [T] = [], greater: [T] = []
    for num in collection{
        if comparator(num, pivot) {
            lesser.append(num)
        } else if comparator(pivot, num) {
            greater.append(num)
        } else {
            equal.append(num)
        }
    }
    return quickSort(lesser, comparator) + equal + quickSort(greater, comparator)
}
