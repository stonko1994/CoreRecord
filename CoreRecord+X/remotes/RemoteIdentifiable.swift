import Foundation

public protocol RemoteIdentifiable {
    associatedtype RemoteId

    var remoteId: RemoteId? { get set }

    static var remoteIdBackingField: FieldKey { get }
}

extension RemoteIdentifiable {
    public static var remoteIdBackingField: FieldKey { .string("remoteId") }
}

extension RemoteIdentifiable where Self: ApplicationRecord {
    public static func findOrCreate(remoteId: Self.RemoteId?) -> Self {
        let record: Self

        if let remoteId = remoteId {
            record = Self.findOrCreate([Self.remoteIdBackingField.description: remoteId])
        } else {
            record = Self.create()
        }

        return record
    }
}
