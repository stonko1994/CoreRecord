import CoreData
import CoreRecord

@objc
class Person: ApplicationRecord {
    @NSManaged var id: Int
    @NSManaged var name: String
    @NSManaged var birthday: Date?
    @NSManaged var driverLicense: Bool
}
