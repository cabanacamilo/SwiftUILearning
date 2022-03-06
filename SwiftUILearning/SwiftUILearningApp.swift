//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    
    @StateObject private var coreDataService = CoreDataService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataService.container.viewContext)
        }
    }
}
