import UIKit

// Linkedlist Example project

let node1 = Node(1)
node1.next = Node(2)
node1.next?.next = Node(3)
node1.next?.next?.next = Node(4)
node1.next?.next?.next?.next = Node(5)

/*
 
 Example:
 
 1 -> 2 -> 3 -> 4 -> 5
 
 
 */


/*
 
 
 Traverse Linkedlist. Means, we are just printing linkedlist in it's own order and just traversing.
 
 
 */


func traverse <T>(node: Node<T>?) {
    var current: Node<T>? = node
    while current != nil {
        print(current!.data)
        current = current?.next
    }
}

/*
 
 Reverse Linkedlist means, we are reversing the content of Linkedlist.
 
 
 */

func reverse <T> (node: Node<T>?) {
    var current: Node<T>? = node
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    while current != nil {
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    
    traverse(node: prev)
    
}

/*
 
 find middle element of the linkedlist
 
 */

func findMiddle<T>(node: Node<T>?) -> T?{
    
    var slow: Node<T>? = node
    var fast: Node<T>? = node
    
    while ((fast != nil) && (fast?.next != nil)) {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    return slow?.data
}
