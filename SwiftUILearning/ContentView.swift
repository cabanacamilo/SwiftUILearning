//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowActionSheet = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    
    var body: some View {
        TabView(selection: $selectedItem) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            Text("Cards View")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Cards")
                }
                .tag(2)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            Text("Add")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                .tag(3)
                .onAppear {
                    self.shouldShowActionSheet.toggle()
                    self.selectedItem = self.oldSelectedItem
                }
            Text("Receipts")
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Receipts")
                }
                .tag(4)
                .onAppear { self.oldSelectedItem = self.selectedItem }
            Text("Settings")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Settings")
                }
                .tag(5)
                .onAppear { self.oldSelectedItem = self.selectedItem }
        }
        .actionSheet(isPresented: $shouldShowActionSheet) { ActionSheet(title: Text("Title"), message: Text("Message"), buttons: [.default(Text("Option 1"), action: option1), .default(Text("Option 2"), action: option2) , .cancel()]) }
        
    }
    
    func option1() {
        // do logic 1
    }
    
    func option2() {
        // do logic 2
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
