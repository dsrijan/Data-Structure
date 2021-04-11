import Foundation

public class Node<T> {
    public var data: T
    public var next: Node?
    
    public init(_ data: T) {
        self.data = data
        self.next = nil
    }
}
