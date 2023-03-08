
import SwiftUI

struct ListView: View{
    
    
    
    @StateObject var someItems = SomeItems()
    let defaultProperty = "Default item name"
    
    var body: some View{
        
        // in theory, you should only have one nav stack.
        // having a nav stack here adds no benefit
        // ...but you would need this if your main/content view did not have one!
        // this project already has a nav stack in content view, so this is unneeded
        NavigationStack() {
        List{
            ForEach($someItems.entries){
                $item in
                TextField("Property 1", text: $item.itemProperty)
            }
            .onDelete {
                if let index = $0.first {
                    someItems.entries.remove(at: index)
                }
            }
        }
        .navigationBarTitle(Text("Some Items"))
        .navigationBarItems(
            trailing: Button(
                action: {
                    withAnimation {
                        self.someItems.entries.insert(SomeItem(itemProperty: defaultProperty),at: 0)
                    }
                }
            ) {
                Image(systemName: "plus")
            }
        )
        
        
        } //End nav stack here.
    }
}
