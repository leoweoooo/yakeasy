//
//  DataSupport.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/02.
//

import Foundation

/// Group of functions that are used to clean and manipulate collected data.
struct DataSupport {
    /// Removes empty elements from an array. Mainly used to clear empty <PARAGRAPH> tags.
    static func removeEmpty(from array: [String]) -> [String] {
        var mutableArray = array
        mutableArray.removeAll(where: { $0.isEmpty })
        return mutableArray
    }
}
