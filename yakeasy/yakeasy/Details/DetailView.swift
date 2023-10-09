//
//  DetailView.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/01.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    let data: Parser.Item
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: []) var coreData: FetchedResults<DrugEntity>
    
    @State private var openWarning = false
    
    var body: some View {
        ZStack {
            scrollContainer
            if openWarning {
                Rectangle().fill(.regularMaterial).ignoresSafeArea()
                WarningView(openWarning: $openWarning, data: data)
            }
        }
    }
    
    var scrollContainer: some View {
        ScrollView(.vertical) {
            LazyVStack {
                imageAndToolbar
                    .padding()
                Divider()
                details
                    .padding()
            }
        }
        .navigationTitle(DisplaySupport.removeBracketsIn(string: data.name))
    }
    
    var imageAndToolbar: some View {
        VStack {
            // MARK: Drug Image
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("MDFSBlue"))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .overlay {
                    HStack {
                        Image(systemName: "pill")
                        Text("아직 사진이 없어요.")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                }
                .accessibilityLabel(Text(data.visualDesc))
            
            // MARK: Toolbar
            HStack {
                Button {
                    withAnimation(Animation.spring(response: 0.45, dampingFraction: 0.9)) { openWarning.toggle() }
                } label: {
                    Image(systemName: { data.available ? "checkmark.circle" : "exclamationmark.triangle" }())
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                        .frame(height: 80)
                        .foregroundColor(.white)
                        .background({ data.available ? (data.OTCAvailable ? Color("dark-green") : Color("dark-yellow")) : Color("dark-orange") }())
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                
                if coreData.contains(where: { $0.drugID == data.id }) {
                    Button {
                        do {
                            viewContext.delete(coreData.first(where: { $0.drugID == data.id })!)
                            try viewContext.save()
                        } catch {
                            print("DetailView: Error removing data = \(error.localizedDescription)")
                        }
                    } label: {
                        Text("복용중이에요. ☺️")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .background(Color("dark-pink"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 3)
                    }
                    
                } else {
                    Button {
                        let newFavorite = DrugEntity(context: viewContext)
                        newFavorite.drugID = Int64(data.id)
                        newFavorite.drugName = data.name
                        newFavorite.drugAvailable = data.available
                        newFavorite.drugOTCAvailable = data.OTCAvailable
                        
                        do {
                            try viewContext.save()
                        } catch {
                            print("DetailView: Error adding to favorites = \(error.localizedDescription)")
                        }
                        
                    } label: {
                        Text("복용중이신가요? 🧐")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, maxHeight: 80)
                            .background(Color("mercury-gray"))
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 3)
                    }
                }
            }
        }
    }
    
    var details: some View {
        VStack {
            // MARK: Details
            VStack(alignment: .leading) {
                Text("용도")
                    .font(.headline)
                    .padding()
                Divider()
                TabView {
                    ForEach(data.useCases, id: \.self) { useCase in
                        CDATAView(article: useCase)
                            .padding(.horizontal)
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .frame(minHeight: 250)
            .background(Color("mercury-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // MARK: Dosage
            VStack(alignment: .leading) {
                Text("사용법")
                    .font(.headline)
                    .padding()
                Divider()
                TabView {
                    ForEach(data.dosage, id: \.self) { dosage in
                        CDATAView(article: dosage)
                            .padding(.horizontal)
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .frame(minHeight: 400)
            .background(Color("mercury-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            // MARK: Warnings
            VStack(alignment: .leading) {
                Text("주의사항")
                    .font(.headline)
                    .padding()
                Divider()
                TabView {
                    ForEach(data.warnings, id: \.self) { warning in
                        CDATAView(article: warning)
                            .padding(.horizontal)
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
            .frame(minHeight: 500)
            .background(Color("mercury-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack {
                HStack {
                    Text("출처: 식품의약품안전처")
                        .font(.headline)
                        .padding(9)
                    Spacer()
                }
                Divider()
                Spacer()
                Link("웹사이트 바로가기", destination: URL(string:"https://nedrug.mfds.go.kr/pbp/CCBBB01/getItemDetail?itemSeq=\(String(data.id))")!)
                Spacer()
            }
            .frame(minHeight: 100)
            .background(Color("mercury-gray"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}


struct WarningView: View {
    @Binding var openWarning: Bool
    let data: Parser.Item
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor({ data.available ? (data.OTCAvailable ? Color("dark-green") : Color("dark-yellow")) : Color("dark-orange") }())
            .frame(maxWidth: .infinity, maxHeight: 500)
            .overlay {
                VStack(alignment: .leading) {
                    
                    // MARK: Headline
                    HStack {
                        Label {
                            if data.available && data.OTCAvailable {
                                Text("일반의약품이에요.")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            }
                            
                            if data.available && !data.OTCAvailable {
                                Text("전문의약품이에요.")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            }
                            
                            if !data.available {
                                Text("더 이상 판매되고 있지 않아요.")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            }
                        } icon: {
                            if data.available {
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            } else {
                                Image(systemName: "exclamationmark.triangle")
                                    .font(.system(size: 25))
                                    .foregroundColor(.white)
                            }
                        }
                        Spacer ()
                        Button {
                            withAnimation(Animation.spring(response: 0.45, dampingFraction: 0.9)) {
                                openWarning.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()

                    // MARK: Text
                    if data.OTCAvailable && data.available {
                        Text("전문가의 처방전 없이 구매할 수 있어요.")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    if !data.OTCAvailable && data.available {
                        Text("구매 전 전문가의 처방전이 필요해요.")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    if !data.available {
                        Text("이 약품을 드시고 계시다면, 전문가와 상담해주세요.")
                            .foregroundColor(.white)
                            .padding()
                    }
                    Spacer()
                }
                .padding()
            }
            .padding()
    }
}

struct CDATAView: View {
    var article: Parser.Item.Article
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.articleTitle)
                .font(.headline)
                .padding(.bottom, 10)
            ForEach(DataSupport.removeEmpty(from: article.paragraphs), id: \.self) { paragraph in
                Text(paragraph)
                    .font(.body)
            }
            Spacer()
        }
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static let sampleItem = Parser.Item(id: 12345, name: "의약품", engName: "Placeholder", available: true, OTCAvailable: true, prodType: ProductTypeCategory.empty, imageURL: "", visualDesc: "", useCases: [], dosage: [], warnings: [])
    static var previews: some View {
        NavigationStack {
            DetailView(data: sampleItem)
        }
    }
}
