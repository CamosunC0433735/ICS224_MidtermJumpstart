//
//  ContentView.swift
//  ICS224_MidtermJumpstart
//
//  Created by ICS 224 on 2023-03-07.
//

import SwiftUI

struct SettingsView: View{
    var  body: some View{
        VStack{
            Text("Settings View - > List View")
            ListView()
        }
    }
    
}

struct ContentView: View {
    
    
    var body: some View {
        
        // Nav stack and Zstack begin, required for settings
        NavigationStack(){
            ZStack{
                
                // TabView begins
                TabView{
                    
                    Text("Tab 1")
                        .tabItem {
                            Label("Tab 1", systemImage: "circle")
                        }
                        .tag("1")
                    
                    GridView()
                        .tabItem {
                            Label("Grid View", systemImage: "square")
                        }
                        .tag("2")
  
                    
                    // I wanted to put the ListView() here.
                    // List view does not work from within a TabView
                    // You could do this, but you would need a nav stack WITHIN each view itself, which is unfortunate.
                    // Still, it IS possible.
                    // In the event of tab view requiring a list inside it, move the nav stack and z stack inside each single tab view.
                    
                    LoadingView()
                        .tabItem {
                            Label("Loading View", systemImage: "triangle")
                        }
                        .tag("3")
                }
                // TabView ends
                
                
            }
            .navigationBarItems(trailing: NavigationLink(
                destination: SettingsView(), label: {
                    Image(systemName: "gear")
                }
            ))
        }
        // NavStack & ZStack end
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
