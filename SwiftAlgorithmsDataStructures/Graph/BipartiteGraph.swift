//
//  BipartiteGraph.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-25.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

func Bipartie() {
    func depthfs(start: Int, color: Int, check: inout [Int], adjList: inout [[Int]]) {
        check[start] = color
        for next in adjList[start] {
            if check[next] == 0 {
                depthfs(start: next, color: color * -1 , check: &check, adjList: &adjList)
            }
        }
    }
    
    var numTests = Int(readLine()!)!
    while numTests > 0 {
        let firstLine = readLine()!.split(separator: " ")
        let n = Int(firstLine[0])! // num of vertices
        let m = Int(firstLine[1])! // num of edges
        var adjList = Array<Array<Int>>(repeating: [], count: n + 1)
        
        for _ in 0..<m {
            let edge = readLine()!.split(separator: " ")
            let u = Int(edge[0])!
            let v = Int(edge[1])!
            adjList[u].append(v)
            adjList[v].append(u)
        }
        
        // dfs (depth first search)
        // 0: not visited, 1: blue, -1: green
        // ALGORITHM TO CHECK BIPARTITE
        var check = [Int](repeating: 0, count: n + 1)
        for v in 1...n {
            if check[v] == 0 {
                depthfs(start: v, color: 1, check: &check, adjList: &adjList)
            }
        }
        
        // all nodes are colored
        var flag = false
        for i in 0..<adjList.count {
            for j in 0..<adjList[i].count {
                let next = adjList[i][j]
                if check[i] == check[next] {
                    flag = true
                    break
                }
            }
        }
        flag ? print("NO") : print("YES")
        numTests -= 1
    }
}
