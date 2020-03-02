//
//  LCA.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-25.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func lcaHelper() {
    let size = Int(readLine()!)!
    var nAryTree = [[Int]](repeating: [], count: size + 1)
    var visited = [Bool](repeating: false, count: size + 1)
    var depth = [Int](repeating: 0, count: size + 1)
    var parent = [Int](repeating: 0, count: size + 1)
    
    for _ in 0..<size-1 {
        let line = readLine()!.split(separator: " ").map{ Int($0)! }
        var a = line[0], b = line[1]
        nAryTree[a].append(b)
        nAryTree[b].append(a)
    }
    
    // starting from vertex 1
    depth[1] = 1
    parent[1] = 1
    visited[1] = true
    let queue = Queue<Int>()
    queue.enqueue(item: 1)
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        
        for i in nAryTree[first] {
            if !visited[i] {
                depth[i] = depth[first] + 1
                queue.enqueue(item: i)
                visited[i] = true
                parent[i] = first
            }
        }
    }
    
    func lca(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        
        if depth[a] < depth[b] {
            swap(&a, &b)
        }
        
        while depth[a] != depth[b] {
            a = parent[a]
        }
        
        if a == b {
            return a
        }
        
        while parent[a] != parent[b] {
            a = parent[a]
            b = parent[b]
        }
        
        return parent[a]
    }
    
    var questions = Int(readLine()!)!
    while questions > 0 {
        let line = readLine()!.split(separator: " ").map{ Int($0)! }
        let a = line[0], b = line[1]
        print(lca(a, b))
        questions -= 1
    }
    
    return
}

