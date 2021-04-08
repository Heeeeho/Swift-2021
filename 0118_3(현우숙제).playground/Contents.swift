import Foundation

class MyQueue {
    
    var Queue:[Int]!
    
    /** Initialize your data structure here. */
    init() {
        Queue = []
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        Queue.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return Queue.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return Queue[0]
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return Queue.isEmpty
    }
}



class MyStack {

    var stack:[Int]!
    
    /** Initialize your data structure here. */
    init() {
        stack = []
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return stack.removeLast()
    }
    
    /** Get the top element. */
    func top() -> Int {
        return stack[stack.count - 1]
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return stack.isEmpty
    }
}
