import Foundation

internal class MigrationRunner {
    private var migrationTypes: [Migration.Type] = []
    private var ran: Bool = false

    func add(migration: Migration.Type) -> MigrationRunner {
        assert(!ran)
        migrationTypes.append(migration)
        return self
    }

    func run() {
        var lastMigration: Migration.Type? = nil
        migrationTypes.forEach { migration in
            if needsRun(migration: migration) {
                let success = migration.run()

                if !success {
                    // TODO: proper error handling?
                    fatalError("[Migration] migration failed")
                }

                lastMigration = migration
            }
        }

        if let lastMigration = lastMigration {
            versionRecord.migrationVersion = lastMigration.migrationVersion
            versionRecord.save()
        }

        ran = true
    }

    private func needsRun(migration: Migration.Type) -> Bool {
        return migration.migrationVersion > currentVersion
    }

    private var versionRecord: Version {
        guard let version = Version.all().first as? Version else {
            return Version.create()
        }

        return version
    }

    private var currentVersion: Double {
        return versionRecord.migrationVersion
    }
}
