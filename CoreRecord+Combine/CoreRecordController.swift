import Foundation
import Combine
import CoreData

public final class CoreRecordController<Entity: ApplicationRecord>: NSObject {
    @Published public var values: [Entity] = []
    private let valuesController: NSFetchedResultsController<Entity>

    public init(fetchRequest: NSFetchRequest<Entity>? = nil) {
        var fetchRequest: NSFetchRequest! = fetchRequest

        if fetchRequest == nil {
            fetchRequest = (Entity.fetchRequest() as! NSFetchRequest<Entity>)
            fetchRequest.sortDescriptors = []
        }

        valuesController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: CoreRecord.sharedRecord.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )

        super.init()

        valuesController.delegate = self

        do {
            try valuesController.performFetch()
            values = valuesController.fetchedObjects ?? []
        } catch {
            print("❌❌❌❌") // TODO: handle properly or fail
        }
    }
}

extension CoreRecordController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let fetchResult = controller.fetchedObjects as? [Entity] else { return }

        values = fetchResult
    }
}
