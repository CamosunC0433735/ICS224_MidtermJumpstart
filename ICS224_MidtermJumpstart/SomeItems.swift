import SwiftUI
import os

class SomeItems: ObservableObject {
    
    
    @Published var entries = [SomeItem]()
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let entriesURL = documentsDirectory.appendingPathComponent("entries")
    
    init(previewMode: Bool) {
        if previewMode {
            entries.append(SomeItem(itemProperty: "Property 1"))
        }
    }
    
    init() {
        loadObjects()
    }
    
    
    func loadObjects() {
        do {
            let data = try Data(contentsOf: SomeItems.entriesURL)
            let decoder = JSONDecoder()
            entries = try decoder.decode([SomeItem].self, from: data)
        } catch {
            os_log("Cannot load due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
    
    
    func saveObjects() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(entries)
            try data.write(to: SomeItems.entriesURL)
        } catch {
            os_log("Cannot save due to %@", log: OSLog.default, type: .debug, error.localizedDescription)
        }
    }
}
