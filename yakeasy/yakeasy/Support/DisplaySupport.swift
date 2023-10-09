//
//  DisplaySupport.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/02.
//

import Foundation

/// Group of methods that are used to format data for displayability.
struct DisplaySupport {
    /// Removes text enclosed in any bracket. Mostly used to clean the item name component. 
    static func removeBracketsIn(string: String) -> String {
        let noBracket = string.components(separatedBy: "(")[0]
        let noSquare = noBracket.components(separatedBy: "[")[0]
        let noCurly = noSquare.components(separatedBy: "{")[0]
        return noCurly
    }
}
