import UIKit
import Foundation


let root = Node(10)

let node1 = Node(-10)
let node2 = Node(30)
let node3 = Node(8)
let node4 = Node(25)
let node5 = Node(60)
let node6 = Node(6)
let node7 = Node(9)
let node8 = Node(28)
let node9 = Node(78)

root.left = node1
root.right = node2

node1.right = node3
node2.left = node4
node2.right = node5

node3.left = node6
node3.right = node7

node4.right = node8
node5.right = node9

/*
 
Tree creation

        10
        /\
    -10   30
      \    /\
      8  25 60
      /\  \   \
     6 9   28  78

 preorder: 10, -10, 8, 6, 9, 30, 25, 28, 60,78
 
 */

/*
 
 Height of Tree is distance of tree root node till it's leaf node. Like here, Distance from root node 10 to leaf node 6,9,28,78 is 4
 
 */

func height<T>(root: Node <T>?) -> Int {
    guard let root = root else {return 0}
    let lHeight: Int = height(root: root.left)
    let rHeight: Int = height(root: root.right)
    
    return ((lHeight > rHeight) ? (lHeight + 1) : (rHeight + 1))
    
}


/// Preorder
/// - Parameter node: Preorder means, we are calculating data first then left node then right node i.e., NLR
func preorder <T>(node: Node <T>?) {
    if let node = node {
        print(node.data)
        preorder(node: node.left)
        preorder(node: node.right)
    }
}



/// Level order printing means, we are printing tree in according to it's level in Left to Right manner
/// - Parameter node: root node
func levelOrder <T>(node: Node <T>?) {
    guard let root = node else {
        return
    }

    var queue = [Node<T>]()
    queue.append(root)

    while !queue.isEmpty {
        if let first = queue.first {
            queue.removeFirst()
            print(first.data)
            if first.left != nil {
                queue.append(first.left!)
            }
            if first.right != nil {
                queue.append(first.right!)
            }
        }
    }

}




/// Zig Zag printing of Tree
/// - Parameter node: root node
func zigzagTraversal <T>(node: Node <T>?) {

    guard let root = node else {return}

    var currentStack = [Node <T>]()
    var nextStack = [Node <T>]()
    var leftToRight = true

    currentStack.append(root)

    while !currentStack.isEmpty {
        if let last = currentStack.last {
            print(last.data)
            currentStack.removeLast()

            if leftToRight {
                if last.left != nil {
                    nextStack.append(last.left!)
                }
                if last.right != nil {
                    nextStack.append(last.right!)
                }
            } else {
                if last.right != nil {
                    nextStack.append(last.right!)
                }
                if last.left != nil {
                    nextStack.append(last.left!)
                }
            }

            if currentStack.isEmpty {
                currentStack = nextStack
                nextStack.removeAll()
                leftToRight = !leftToRight
            }

        }
    }

}


/// Lowest Common Ancestor
/// - Parameters:
///   - node: root node
///   - d1: data1
///   - d2: data2
/// - Returns: lowest common ancestor node
func findLCA <Int>(node: Node <Int>?, d1: Int, d2: Int) -> Node <Int>? {

    // base condition
    guard let root: Node<Int> = node else {return nil}

    // if root is the lca

    if ((root.data == d1) || (root.data == d2)) {
        return root
    }

    // otherwise find in both left and right subtrees

    let leftLCA = findLCA(node: root.left, d1: d1, d2: d2)
    let rightLCA = findLCA(node: root.right, d1: d1, d2: d2)

    // if both left and right is not nil then root is the lca otherwise which ever is not nil is the lca

    if (leftLCA != nil)  && (rightLCA != nil) {
        return root
    }

    return (leftLCA != nil ? leftLCA : rightLCA)



}
