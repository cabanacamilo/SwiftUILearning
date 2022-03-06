//
//  CoreDataService.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/06.
//

import Foundation
import CoreData

class CoreDataService: ObservableObject {
    
    let container = NSPersistentContainer(name: "AppInternalStorage")
    
    init() {
        container.loadPersistentStores { des, err in
            if let err = err {
                print(err.localizedDescription)
            }
        }
    }
    
}
