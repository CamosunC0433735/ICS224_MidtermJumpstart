
import SwiftUI

struct LoadingView: View {
    let archiveURL = FileManager().urls(for: .documentDirectory,
                                        in: .userDomainMask).first!.appendingPathComponent("entries")
    @State var itemProperty = ""
    
    var body: some View{
        VStack{
            
            TextField("Item Property", text: $itemProperty).padding()
            
            Button("Load", action:{
                let data = try? Data(contentsOf: archiveURL)
                if let d = data {
                    let decoder = JSONDecoder()
                    let item = (try? decoder.decode(SomeItem.self,
                                                       from: d)) ?? SomeItem(itemProperty: "")
                    itemProperty = item.itemProperty
                }
            })
            .padding()
            
            
            Button("Save", action:{
                let encoder = JSONEncoder()
                let data = try? encoder.encode(SomeItem(itemProperty: itemProperty))
                try? data?.write(to: archiveURL)
            }).padding()
        }
    }
}
