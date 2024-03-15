#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public protocol TimestampsHaving {
    var createdAt: Date { get set }
    var updatedAt: Date { get set }

    static var createdAtField: FieldKey { get }
    static var updatedAtField: FieldKey { get }
}

public extension TimestampsHaving {
    static var createdAtField: FieldKey {
        .createdAt
    }

    static var updatedAtField: FieldKey {
        .updatedAt
    }
}
