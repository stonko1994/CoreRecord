import Foundation
import CoreData

open class ApplicationRecord: NSManagedObject {
    open class var autoIncrementingId: FieldKey? {
        nil
    }

    open class var entityName: EntityName {
        var name = NSStringFromClass(self)

        if name.contains(".") {
            let comp = name
                .split { $0 == "." }
                .map { String($0) }
            if comp.count > 1 {
                name = comp.last!
            }
        }

        if name.contains("_") {
            var comp = name
                .split { $0 == "_" }
                .map { String($0) }
            var last: String = ""
            var remove = -1

            for (index, string) in comp.reversed().enumerated() {
                if last == string {
                    remove = index
                }
                last = string
            }

            if remove > -1 {
                comp.remove(at: remove)
                name = comp.joined(separator: "_")
            }
        }

        return .string(name)
    }

    // TODO: find out why this is needed and why `super.entity()` doesn't return the expected value
    open override class func entity() -> NSEntityDescription {
        NSEntityDescription.entity(
            forEntityName: self.entityName.description,
            in: CoreRecord.sharedRecord.managedObjectContext
        ) ?? super.entity()
    }

    open class func entity(in managedObjectContext: NSManagedObjectContext) -> NSEntityDescription {
        NSEntityDescription.entity(
            forEntityName: self.entityName.description,
            in: managedObjectContext
        ) ?? super.entity()
    }
}
