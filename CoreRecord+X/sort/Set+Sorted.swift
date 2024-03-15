#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public extension Set where Element: Sortable {
    var sorted: [Element] {
        guard !isEmpty,
              let firstElement = first else {
              return Array(self)
        }

        let type = type(of: firstElement)
        return sorted(by: type.sortBy)
    }
}
