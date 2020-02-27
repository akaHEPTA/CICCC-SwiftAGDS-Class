//
//  547.FriendCircles.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-25.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

class Solution {
    func findCircleNum(_ M: [[Int]]) -> Int {
        var adjList = [[Int]](repeating: [], count: M.count)
        var parent = [Int](repeating: 0, count: M.count), count = 0
        var visited = [Bool](repeating: false, count: M.count)
        
        for i in 0..<M.count {
            for j in i..<M[i].count {
                if i != j && M[i][j] == 1 {
                    adjList[i].append(j)
                    adjList[j].append(i)
                }
            }
        }
        
        func dfs(start: Int, visited: inout [Bool], adjList: inout [[Int]]) {
            for j in 0..<adjList[start].count {
                if adjList[start][j] == 1 && !visited[j] {
                    visited[start] = true
                    count += 1
                    dfs(start: j, visited: &visited, adjList: &adjList)
                }
            }
        }
        
        // setting parent as itself (every node is root)
        //        for i in 0..<adjList.count { parent[i] = i }
        for i in 0..<adjList.count {
            dfs(start: i, visited: &visited, adjList: &adjList)
        }
        
        return count
    }
    
}

