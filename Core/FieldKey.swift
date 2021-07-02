public indirect enum FieldKey {
    case id
    case string(String)
    case prefix(FieldKey, FieldKey)
}

extension FieldKey: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        switch value {
        case "id":
            self = .id
        default:
            self = .string(value)
        }
    }
}

extension FieldKey: CustomStringConvertible {
    public var description: String {
        switch self {
        case .id:
            return "id"
        case .string(let name):
            return name
        case .prefix(let prefix, let key):
            return prefix.description + key.description
        }
    }
}

extension FieldKey: Equatable { }

extension FieldKey: Hashable { }
