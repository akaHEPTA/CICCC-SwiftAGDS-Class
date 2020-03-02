//
//  FloodFill2.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-27.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

class FloodFill2 {
    class Square {
        let x: Int
        let y: Int
        
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    let size: Int
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    var townMap = [[Int]]()
    var group = [[Int]](repeating: [Int](repeating: 0, count: 25), count: 25)
    
    init () {
        let n = Int(readLine()!)!
        self.size = n
        
        for _ in 0..<n {
            let row = readLine()!.map{ Int(String($0))! }
            townMap.append(row)
        }
        
        var id = 0
        for x in 0..<n {
            for y in 0..<n {
                if townMap[x][y] == 1 && group[x][y] == 0 {
                    id += 1
                    bfs(x: x, y: y, id: id, n: n)
                }
            }
        }
        
        print(id)
        var answer = [Int](repeating: 0, count: 25 * 25)
        for i in 0..<n {
            for j in 0..<n {
                answer[group[i][j]] += 1
            }
        }
        answer = Array(answer[1...id])
        answer.sort()
        for i in 0..<id {
            print(answer[i])
        }
    }
    
    func bfs(x: Int, y: Int, id: Int, n: Int) {
        let q = Queue<Square>()
        q.enqueue(item: Square(x, y))
        group[x][y] = id
        
        while !q.isEmpty() {
            let square = q.dequeue()!
            let (x, y) = (square.x, square.y)
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if isSafe(nx, ny) {
                    if townMap[nx][ny] == 1 && group[nx][ny] == 0 {
                        q.enqueue(item: Square(nx, ny))
                        group[nx][ny] = id
                    }
                }
            }
        }
    }
    
    func isSafe(_ x: Int, _ y: Int) -> Bool {
        guard 0 <= x && x < self.size && 0 <= y && y < self.size else { return false }
        return true
    }
    
}

