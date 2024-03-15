#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

extension ApplicationRecord {
    open override func willSave() {
        guard supportsTimestamps,
              let clazz = type(of: self) as? TimestampsHaving.Type else {
            return
        }

        setDate(for: clazz.updatedAtField)
    }

    open override func awakeFromInsert() {
        guard supportsTimestamps,
              let clazz = type(of: self) as? TimestampsHaving.Type else {
            return
        }

        setDate(for: clazz.createdAtField)
    }

    private var supportsTimestamps: Bool {
        self is TimestampsHaving
    }

    private func setDate(`for` fieldKey: FieldKey) {
        // Assigning a value to `.updatedAt` would trigger another willSave which will result in an infinity loop.
        // Using setPrimitiveValue bypasses the KVO which results in no additional willSave call.
        // See https://cocoacasts.com/three-features-of-nsmanagedobject-you-may-not-know-about for more information.
        setPrimitiveValue(Date(), forKey: fieldKey.description)
    }
}
