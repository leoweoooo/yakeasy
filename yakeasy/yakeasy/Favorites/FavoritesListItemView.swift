//
//  FavoritesListItemView.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/05.
//

import SwiftUI

struct FavoritesListItemView: View {
    
    let data: DrugEntity
    
    @State private var favorites = false
    
    var body: some View {
        VStack {
            // MARK: Image & Description
            HStack {
                // MARK: Image
                Image(systemName: "pill")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(Color(uiColor: UIColor(named: "MDFSBlue") ?? .systemBlue))
                    .clipShape(Circle())
                
                // MARK: Content
                VStack(alignment: .leading, spacing: 3) {
                    // MARK: Name
                    if data.drugAvailable {
                        Text(DisplaySupport.removeBracketsIn(string: data.drugName ?? ""))
                            .font(.headline)
                            .lineLimit(1)
                    } else {
                        Text("⚠️ \(DisplaySupport.removeBracketsIn(string: data.drugName ?? ""))")
                            .font(.headline)
                            .lineLimit(1)
                    }
                    
                    // MARK: Description
                    Text(data.drugOTCAvailable ? "일반의약품" : "전문의약품")
                        .font(.caption)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 6)
                        .background({ data.drugAvailable ? (data.drugOTCAvailable ? Color(uiColor: UIColor(named: "dark-green") ?? .systemGreen) : Color(uiColor: UIColor(named: "dark-yellow") ?? .systemYellow)): Color(uiColor: UIColor(named: "dark-orange") ?? .systemOrange) }())
                        .background({ data.drugAvailable ? (data.drugOTCAvailable ? Color(uiColor: UIColor(named: "dark-green") ?? .systemGreen) : Color(uiColor: UIColor(named: "dark-yellow") ?? .systemYellow)): Color(uiColor: UIColor(named: "dark-orange") ?? .systemOrange) }())
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.horizontal, 5)
                Spacer()
            }
            .padding(.vertical, 3)
            Divider()
        }
    }
}
