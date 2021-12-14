import Foundation
import CoreData

extension ApplicationRecord {
    public static func exists(
        _ condition: [String: Any],
        context: NSManagedObjectContext = NSManagedObjectContext.defaultContext
    ) -> Bool {
        !self.fetch(properties: condition, context: context, sortDescriptors: nil, limit: 1).isEmpty
    }
}
