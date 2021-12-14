import SwiftUI

public struct CoreRecordInjector: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .environment(\.managedObjectContext, CoreRecord.sharedRecord.managedObjectContext)
    }
}

extension View {
    public func injectCoreRecord() -> some View {
        self.modifier(CoreRecordInjector())
    }
}
