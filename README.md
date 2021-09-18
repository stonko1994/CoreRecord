# CoreRecord
The ActiveRecord like Core Data object management

### Migrations
It's pretty common to need migrations from time to time when the App envolves over time.

`CoreRecord` comes with a sub-modle calle `Migrations` handling exactly this use-case. 

#### Preconditions
In your `CoreData` model you need to add an entity called `Version` with only one property called `migrationVersion`. This is needed to check if a certain migration need to run or was already executed.

#### Setup
To create your migration all you need to do is to add a class in your target which implements the `Migration` protocol.
This protocol requires you to add a `migrationVersion` as double. This will be stored in your CoreData model and will be used for future migrations.

This enables migrations also when someone skips an App version. All migrations with a version higher than the latest stored one will be executed.

Example:

```Swift
class DeleteAllPlayers: Migration {
    static var migrationVersion: Double = 1631960191.5761361 // 18.9.2021

    static func run() -> Bool {
        Player.deleteAll()

        return true
    }
}
```

#### Execute
To execute the migration you need to register them and tell CoreRecord to run them.

The classic place for this would be the `AppDelegate.application(_:didFinishLaunchingWithOptions:)`

Example:
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    CoreRecord.sharedRecord.modelName = "HockeyClock"

    CoreRecord.sharedRecord.migrations
        .add(migration: DeleteAllPlayers.self)
        .runMigrations()

    return true
}
```
