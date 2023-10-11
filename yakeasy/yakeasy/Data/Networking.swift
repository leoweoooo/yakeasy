//
//  Networking.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/01.
//

import Foundation

/// Group of methods that are used to fetch data from external APIs. 
class Networking {
    // Global variables used by all fetch functions.
    private var apiKey = ""
    private var scheme = "http"
    private var host = "apis.data.go.kr"
    
    func fetchInformation(for searchQuery: String) async throws -> Data {
        // Building a URL from URLComponents
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = "/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03"
        components.queryItems = [
            URLQueryItem(name: "serviceKey", value: self.apiKey),
            URLQueryItem(name: "type", value: "xml"),
            URLQueryItem(name: "item_name", value: searchQuery)
        ]
        
        // TODO: Create proper error management. 
        // Creating an URL from URLComponents
        guard let url = components.url else { throw Networking.NetworkError.badURL }
        print("Networking: Connecting to address \(url)")
        
        // Making a network request using the URL
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Ensuring that we have a successful response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw Networking.NetworkError.badResponse }
        print("Networking: Data received")
        
        // Returning the data received
        return data
    }
    
    func fetchImageInfo(for itemID: Int) async throws -> Data {
        // Building a URL from URLComponents
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.host
        components.path = "/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03"
        components.queryItems = [
            URLQueryItem(name: "serviceKey", value: self.apiKey),
            URLQueryItem(name: "type", value: "xml"),
            URLQueryItem(name: "item_seq", value: String(itemID))
        ]
        
        guard let url = components.url else { throw Networking.NetworkError.badURL }
        print("Networking: Connecting to address \(url)")
        
        // Making a network request using the URL
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Ensuring that we have a successful response
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw Networking.NetworkError.badResponse }
        print("Networking: Data received")
        
        // Returning the data received
        return data
    }
    
    enum NetworkError: Error {
        case badURL
        case badResponse
        case badData
    }
}
