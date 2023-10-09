//
//  SearchModel.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/02.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class SearchModel: ObservableObject {
    
    @Published var searchResults: [Parser.Item] = []
    @Published var searchQuery = ""
    
    private var network = Networking()
    private var parser = Parser()
    
    private var searchTask: Task<Void, Never>?
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        $searchQuery
            .removeDuplicates()
            .debounce(for: .milliseconds(250), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.search()
            })
            .store(in: &cancellables)
    }
    
    func search() {
        guard !searchQuery.isEmpty else { return }
        searchTask?.cancel()
        searchTask = nil
        searchTask = Task {
            do {
                let fetchedData = try await network.fetchInformation(for: searchQuery)
                searchResults = parser.parse(XML: fetchedData)
                searchResults = searchResults.sorted(by: { $0.available && !$1.available })
            } catch {
                // TODO: Create proper error management. 
                print("SearchModel: Failed to fetch data = \(error.localizedDescription)")
            }
        }
    }
    
}
