//
//  SearchListItemView.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/01.
//

import SwiftUI

struct SearchListItemView: View {
    
    let data: Parser.Item
    
    @State private var favorites = false
    
    var body: some View {
        VStack {
            // MARK: Image & Description
            HStack {
                // MARK: Image
                Image(systemName: "pill")
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .background(Color("MDFSBlue"))
                    .clipShape(Circle())
                
                // MARK: Content
                VStack(alignment: .leading, spacing: 3) {
                    // MARK: Name
                    if data.available {
                        Text(DisplaySupport.removeBracketsIn(string: data.name))
                            .font(.headline)
                            .lineLimit(1)
                    } else {
                        Text("⚠️ \(DisplaySupport.removeBracketsIn(string: data.name))")
                            .font(.headline)
                            .lineLimit(1)
                    }
                    
                    // MARK: Description
                    Text(data.OTCAvailable ? "일반의약품" : "전문의약품")
                        .font(.caption)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 6)
                        .background({ data.available ? (data.OTCAvailable ? Color("dark-green") : Color("dark-yellow")): Color("dark-orange") }())
                        .background({ data.available ? (data.OTCAvailable ? Color("dark-green") : Color("dark-yellow")): Color("dark-orange") }())
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

//struct SearchListItemView_Previews: PreviewProvider {
//    static var parser = Parser()
//    static var previews: some View {
//        SearchListItemView(item: parser.items[1])
//            .environmentObject(parser)
//            .onAppear {
//                fetchAndParse(parser: parser)
//            }
//    }
//}
