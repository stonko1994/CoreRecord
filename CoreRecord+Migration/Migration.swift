#if SWIFT_PACKAGE
import CoreRecordCore
#endif
import Foundation

public protocol Migration {
    static var migrationVersion: Double { get }

    static func run() -> Bool
}
