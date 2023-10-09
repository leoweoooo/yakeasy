//
//  SearchView.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/01.
//

import SwiftUI

struct SearchView: View {
    @StateObject var searchModel = SearchModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(searchModel.searchResults, id: \.id) { item in
                    NavigationLink {
                        DetailView(data: item)
                    } label: {
                        SearchListItemView(data: item)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("통합검색")
            .searchable(text: $searchModel.searchQuery, prompt: "검색")
            .scrollDismissesKeyboard(.immediately)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var parser = Parser()
    static var previews: some View {
        SearchView()
    }
}
