#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import CoreData

@objc(Version)
public class Version: ApplicationRecord {
    @NSManaged
    var migrationVersion: Double
}
