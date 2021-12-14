import CoreData

/// Represents a configuration record which can always only have one record in the database
open class ConfigurationRecord: ApplicationRecord {
    @available(*, unavailable)
    open override class var autoIncrementingId: FieldKey? {
        nil
    }

    public static func record(context: NSManagedObjectContext = NSManagedObjectContext.defaultContext) -> Self {
        if let existingRecord = first(context: context) {
            return existingRecord
        }

        return createInitialConfiguration(context: context)
    }

    open class func createInitialConfiguration(
        context: NSManagedObjectContext = NSManagedObjectContext.defaultContext
    ) -> Self {
        fatalError("createInitialConfiguration has to be overridden in subclasses")
    }

    // TODO: autogenerating an initial record
}
