import Foundation
import CoreData

open class ApplicationRecord: NSManagedObject {
    open class var autoIncrementingId: String? {
        return nil
    }
}
