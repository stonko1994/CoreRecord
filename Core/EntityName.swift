public enum EntityName {
    case string(_ name: String)
}

extension EntityName: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}

extension EntityName: CustomStringConvertible {
    public var description: String {
        switch self {
        case .string(let name):
            return name
        }
    }
}

extension EntityName: Equatable { }

extension EntityName: Hashable { }
