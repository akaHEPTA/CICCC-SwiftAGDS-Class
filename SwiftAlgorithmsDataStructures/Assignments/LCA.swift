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
    let queue = Queue<Int>()
    
    for _ in 1..<size {
        let line = readLine()!.split(separator: " ")
        var a = Int(line[0])!, b = Int(line[1])!
        if a > b { swap(&a, &b) }
        nAryTree[a].append(b)
        nAryTree[b].append(a)
        parent[b] = a
        depth[b] = depth[a] + 1
    }
    
    queue.enqueue(item: 1) // starting from vertex 1
    depth[1] = 1
    visited[1] = true
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        
        for i in 1..<nAryTree.count {
            if !visited[i] {
                queue.enqueue(item: i)
                visited[i] = true
            }
        }
    }
    
    func lca(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while depth[a] != depth[b] {
            if depth[a] > depth[b] {
                a = parent[a]
            }
            else {
                b = parent[b]
            }
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
    
    let questions = Int(readLine()!)!
    for _ in 0..<questions {
        let line = readLine()!.split(separator: " ")
        let a = Int(line[0])!, b = Int(line[1])!
        print(lca(a, b))
    }
    
    return
}

