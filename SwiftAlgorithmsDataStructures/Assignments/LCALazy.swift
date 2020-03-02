//
//  LCALazy.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 3/2/19.
//  Copyright © 2020 Derrick Park. All rights reserved.
//
import Foundation

/// O(N) time query
func LCAN() {
    let n = Int(readLine()!)!
    var adj = [[Int]](repeating: [], count: n + 1)
    var check = [Bool](repeating: false, count: n + 1)
    var depth = [Int](repeating: 0, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
    
    for _ in 0..<n-1 {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let u = edge[0]
        let v = edge[1]
        adj[u].append(v)
        adj[v].append(u)
    }
    
    depth[1] = 0
    check[1] = true
    let q = Queue<Int>()
    q.enqueue(item: 1)
    parent[1] = 0
    while !q.isEmpty() {
        let x = q.dequeue()!
        for v in adj[x] {
            if !check[v] {
                depth[v] = depth[x] + 1
                check[v] = true
                parent[v] = x
                q.enqueue(item: v)
            }
        }
    }
    
    var m = Int(readLine()!)!
    while m > 0 {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        var x = edge[0]
        var y = edge[1]
        if depth[x] < depth[y] {
            swap(&x, &y)
        }
        while depth[x] != depth[y] {
            x = parent[x]
        }
        while x != y {
            x = parent[x]
            y = parent[y]
        }
        print(x)
        m -= 1
    }
}
