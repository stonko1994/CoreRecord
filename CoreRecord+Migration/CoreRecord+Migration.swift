#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public extension CoreRecord {
    var migrations: Migrations {
        Migrations()
    }
}

public class Migrations {
    private let migrationRunner = MigrationRunner()
    internal init() { }

    public func add(migration: Migration.Type) -> Self {
        _ = migrationRunner.add(migration: migration)
        return self
    }

    public func runMigrations() {
        migrationRunner.run()
    }
}
