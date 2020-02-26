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
        var adjList = M
        var visited = Array(repeating: false, count: M.count)
        
        var count = 0
        for i in 0..<M.count {
            if !visited[i] {
                dfs(start: i, visited: &visited, adjList: &adjList)
                count += 1
            }
        }
        return count
    }
    
    func dfs(start: Int, visited: inout [Bool], adjList: inout [[Int]]) {
        visited[start] = true
        for i in adjList[start] {
            if !visited[i] {
                dfs(start: i, visited: &visited, adjList: &adjList)
            }
        }
    }
}
