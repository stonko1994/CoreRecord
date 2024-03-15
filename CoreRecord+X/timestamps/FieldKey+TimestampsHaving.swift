#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

internal extension FieldKey {
    static var updatedAt: Self { "updatedAt" }
    static var createdAt: Self { "createdAt" }
}
