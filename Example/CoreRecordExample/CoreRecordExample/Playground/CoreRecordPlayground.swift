import CoreRecord

public class CoreRecordPlayground {
    public func run(
        example: CoreRecordExample,
        modelName: String,
        useInMemoryStore: Bool = true
    ) {
        CoreRecord.sharedRecord.modelName = modelName
        if useInMemoryStore {
            CoreRecord.sharedRecord.useInMemoryStore()
        }

        example.run()
    }
}
