//
//  BFS.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-24.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func storeInAdjacencyListAndBFS() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }

    // BFS - Queue O(V + E)
    var visited = [Bool](repeating: false, count: n + 1)
    var depth = [Int](repeating: 0, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
    let queue = Queue<Int>()
    queue.enqueue(item: 1) // starting from vertex 1
    visited[1] = true

    while !queue.isEmpty() {
        let first = queue.dequeue()!
        print(first) // print in bfs order
        for v in adjList[first] {
            if !visited[v] {
                queue.enqueue(item: v)
                visited[v] = true
            }
        }
    }
}

