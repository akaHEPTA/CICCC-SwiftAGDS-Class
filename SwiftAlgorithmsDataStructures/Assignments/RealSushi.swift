//
//  RealSushi.swift
//  RealSushi
//
//  Created by Richard Cho on 2020-02-27.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func realSushi() {
    
    
    let first = readLine()!.split(separator: " ")
    // n: total number of nodes / n-1: number of edges / m: number of real sushi restaurant
    let n = Int(first[0])!, m = Int(first[1])!
    var map = [[Int]](repeating: [Int](), count: n)
    var visited = [Bool](repeating: false, count: n)
    var realSushi = readLine()!.split(separator: " ").map{ Int($0)! }
    
    for _ in 0..<n-1 {
        let temp = readLine()!.split(separator: " ")
        let p = Int(temp[0])!, q = Int(temp[1])!
        map[p].append(q)
        map[q].append(p)
    }
    
    
    
    
}


func getCost(_ a: Int, _ b: Int) -> Int {
    a
    
    return 0
}

func BFS2() {
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


