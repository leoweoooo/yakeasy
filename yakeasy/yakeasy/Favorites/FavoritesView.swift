//
//  FavoritesView.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/05.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) private var favorites: FetchedResults<DrugEntity>
    var body: some View {
        NavigationStack {
            List {
                ForEach(favorites) { favorite in
                    FavoritesListItemView(data: favorite)
                        .swipeActions {
                            Button(role: .destructive, action: {
                                    deleteItem(data: favorite)
                                }, label: {
                                    Image(systemName: "trash")
                                })
                        }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("복용중")
        }
    }
    
    private func deleteItem(data: DrugEntity) {
        viewContext.delete(data)
        do {
            try viewContext.save()
        } catch {
            // TODO: Create proper error management
            print("FavoritesView: Failed to delete data = \(error.localizedDescription)")
        }
    }

}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environment(\.managedObjectContext, Favorites.preview.container.viewContext)
    }
}
