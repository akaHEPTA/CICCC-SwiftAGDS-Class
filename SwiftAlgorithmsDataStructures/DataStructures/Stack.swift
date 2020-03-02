//
//  Stack.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> : Sequence {
    /// top of stack
    private var first: Node<E>? = nil
    /// size of the stack
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty stack.
    public init() {}
    
    /// Adds the item to this stack
    /// - Parameter item: the item to add
    public func push(item: E) {
        if isEmpty() {
            first = Node(item: item)
        } else {
            var cursor: Node<E> = self.first!
            for _ in 0 ..< (count - 1) {
                cursor = cursor.next!
            }
            cursor.next = Node(item: item)
        }
        count += 1
    }
    
    /// Removes and returns the item most recently added to this stack.
    public func pop() -> E? {
        guard first != nil else { return nil }
        defer {
            if count == 1 {
                first = nil
            } else {
                var cursor: Node<E> = first!
                for _ in 0 ..< (count - 2) {
                    cursor = cursor.next!
                }
                cursor.next = nil
            }
            count -= 1
        }
        return last().item
    }
    
    /// Returns (but does not remove) the item most recently added to this stack.
    public func peek() -> E? {
        guard first != nil else { return nil }
        return last().item
    }
    
    /// Returns (but does not remove) the node most recently added to this stack.
    private func last() -> Node<E> {
        var cursor: Node<E> = first!
        for _ in 0 ..< (count - 1) {
            cursor = cursor.next!
        }
        return cursor
    }
    
    /// Returns true if this stack is empty.
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    /// StackIterator that iterates over the items in LIFO order.
    public struct StackIterator<E> : IteratorProtocol {
        private var current: Node<E>?
        private var count: Int {
            guard current != nil else { return 0 }
            var c: Node<E> = current!, cnt: Int = 0
            while c.next != nil {
                c = c.next!
                cnt += 1
            }
            return cnt
        }
        private var cnt: Int = 0
        
        fileprivate init(_ first: Node<E>?) {
            current = first
        }
        
        public mutating func next() -> E? {
            guard current != nil, count >= cnt
                else { return nil }
            
            var cursor: Node<E> = current!
            for _ in 0..<(count - cnt) {
                cursor = cursor.next!
            }
            cnt += 1
            return cursor.item
        }
        
        public typealias Element = E
    }
    
    /// Returns an iterator that iterates over the items in this Stack in LIFO order.
    public __consuming func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(first)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return self.reduce(into: "") { $0 += "\($1) " }
    }
}
