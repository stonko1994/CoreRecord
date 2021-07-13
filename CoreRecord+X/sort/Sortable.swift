import Foundation

public protocol Sortable {
    static var sortBy: ((_ lhs: Self, _ rhs: Self) -> Bool) { get }
}
