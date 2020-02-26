//
//  TreeTraversal.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Richard Cho on 2020-02-19.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import Foundation

//class TreeNode {
//    var data: T?
//    var leftChild: TreeNode?
//    var rightChild: TreeNode?
//}

var tree = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 50)

func preOrder(_ node: Int) {
    guard node != -1 else { return }
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    preOrder(tree[node][0])
    preOrder(tree[node][1])
}

func inOrder(_ node: Int) {
    guard node != -1 else { return }
    inOrder(tree[node][0])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
    inOrder(tree[node][1])
}

func postOrder(_ node: Int) {
    guard node != -1 else { return }
    postOrder(tree[node][0])
    postOrder(tree[node][1])
    print(Character(UnicodeScalar(node + 65)!), terminator: "")
}

func treeTraversal() {
    let n = Int(readLine()!)!
    
    for _ in 0 ..< n {
        let nodeInfo = readLine()!.split(separator: " ").map { String($0) }
        // A, ..., Z
        let x = Int(Character(nodeInfo[0]).asciiValue! - 65)
        let l = Int(Character(nodeInfo[1]).asciiValue!)
        let r = Int(Character(nodeInfo[1]).asciiValue!)
        
        // ascii 46 -> . -> -1
        tree[x][0] = l == 46 ? -1 : 1 - 65
        tree[x][1] = r == 46 ? -1 : 1 - 65
    }
    
    preOrder(0)
    print()
    inOrder(0)
    print()
    postOrder(0)
}
