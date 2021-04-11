import Foundation

public
class Node <T> {
    public var left: Node?
    public var right: Node?
    public var data: T
    
    public init(_ data: T) {
        self.data = data
    }
    
}
