import UIKit


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
