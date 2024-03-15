#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public protocol Sortable {
    static var sortBy: ((_ lhs: Self, _ rhs: Self) -> Bool) { get }
}
