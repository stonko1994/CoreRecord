import CoreData

@objc(Version)
public class Version: ApplicationRecord {
    @NSManaged
    var migrationVersion: Double
}
