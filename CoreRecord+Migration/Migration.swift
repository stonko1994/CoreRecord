import Foundation

public protocol Migration {
    static var migrationVersion: Double { get }

    static func run() -> Bool
}
