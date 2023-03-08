import SwiftUI
import os

struct SomeItem: Identifiable, Codable {
    var id = UUID()
    
    var itemProperty: String
    
    init(itemProperty: String) {
        self.itemProperty = itemProperty
    }
    
}
