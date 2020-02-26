//
//  ConnectedComponetsSample.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-25.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func storeInAdjacencyListAndDFS2() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let n = Int(firstLine[0])!
    // # of edges
    let m = Int(firstLine[1])!
    var adjList = [[Int]](repeating: [], count: n + 1)
    var count = 0
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
    var visited = [Bool](repeating: false, count: n+1)
    dfs2(start: 1, visited: &visited, adjList: &adjList, count: &count)
}

func dfs2(start: Int, visited: inout [Bool], adjList: inout [[Int]], count: inout Int) {
    visited[start] = true
    print(start)
    count += 1
    
    for v in adjList[start] {
        if !visited[v] {
            dfs2(start: v, visited: &visited, adjList: &adjList, count: &count)
        }
    }
}
