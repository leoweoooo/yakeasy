//
//  Favorites.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/05.
//

import Foundation
import CoreData

struct Favorites {
    static let shared = Favorites()
    
    static var preview: Favorites = {
        let result = Favorites(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = DrugEntity(context: viewContext)
            newItem.drugID = 12345
            newItem.drugAvailable = true
            newItem.drugOTCAvailable = false
            newItem.drugName = "Placeholder"
        }
        do {
            try viewContext.save()
        } catch {
            // TODO: Create proper error management. 
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FavoritesModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                // TODO: Create proper error management.
                print("CoreData: Failed to load data = \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Create proper error management.
                print("CoreData: Failed to save data = \(error.localizedDescription)")
            }
        }
    }
}
