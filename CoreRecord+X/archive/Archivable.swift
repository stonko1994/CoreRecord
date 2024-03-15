import CoreData
#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public protocol Archivable: AnyObject {
    var archivedAt: Date? { get set }
    var active: Bool { get }
    func archive()
}

public extension Archivable {
    var active: Bool {
        archivedAt != nil
    }
}

public extension Archivable where Self: ApplicationRecord {
    func archive() {
        archivedAt = Date()
        save()
    }

    static func allActive(
        context: NSManagedObjectContext = NSManagedObjectContext.defaultContext
    ) -> [ApplicationRecord] {
        query(
            NSPredicate(format: "archivedAt = NULL"),
            context: context
        )
    }
}
