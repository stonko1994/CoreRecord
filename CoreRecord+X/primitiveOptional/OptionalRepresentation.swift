#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

/// A primitive value can't be optional in ObjC and therefore also not for CoreData.
/// This property wrapper provides a way to hide the `NSNumber` usage for an optional primitive value.
/// The `ApplicationRecord` needs to have a backing field for the optional value. In the CoreData model you
/// only need the backing property then.
@propertyWrapper
public class OptionalRepresentation<Record: ApplicationRecord> {
    public typealias BackingCoreDataPropertyKeyPath = ReferenceWritableKeyPath<Record, NSNumber?>
    private let keyPath: BackingCoreDataPropertyKeyPath

    private weak var record: Record!

    public init(_ keyPath: BackingCoreDataPropertyKeyPath) {
        self.keyPath = keyPath
    }

    // TODO: Find a better solution for this
    public func registerObject(_ record: Record) {
        self.record = record
    }

    public var wrappedValue: Int? {
        get { record[keyPath: keyPath]?.intValue }
        set {
            guard let value = newValue else {
                record[keyPath: keyPath] = nil
                return
            }

           record[keyPath: keyPath] = NSNumber(value: value)
        }
    }
}
