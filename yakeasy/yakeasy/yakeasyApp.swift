//
//  yakeasyApp.swift
//  yakeasy
//
//  Created by Leo Cho on 2023/08/21.
//

import SwiftUI

@main
struct yakeasyApp: App {
    let favoritesController = Favorites.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, favoritesController.container.viewContext)
                .preferredColorScheme(.light)
        }
    }
}
