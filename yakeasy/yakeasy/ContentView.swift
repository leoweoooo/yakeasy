//
//  ContentView.swift
//  yakeasy
//
//  Created by Leo Cho on 2023/08/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @State private var tabSelection: Int = 1
    @State private var shouldShowTerms = !UserDefaults.standard.bool(forKey: "TermsAccepted")
    
    var body: some View {
        TabView(selection: $tabSelection) {
            SearchView()
                .tabItem {
                    Label("통합검색", systemImage: "magnifyingglass")
            }
            
            FavoritesView()
                .tabItem {
                    Label("복용중", systemImage: "doc.text")
                }
                .environment(\.managedObjectContext, viewContext)
        }
        .sheet(isPresented: $shouldShowTerms) {
            TermsAndConditions(shouldShowTerms: $shouldShowTerms)
        }
    }
}


struct TermsAndConditions: View {
    @Binding var shouldShowTerms: Bool
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("⚠️ 주의!")
                    .font(.system(size: 50, weight: .black))
                    .padding(.top, 40)
                    .padding(.bottom, 30)

                Text("약과 처방에 관해서는 관련 전문가와 상담해주세요.")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("")
                    .padding(.bottom)
                
                Text("약에 관한 정보는 식품의약품안전처에서")
                Text("가져왔습니다.")
                    .padding(.bottom)
                
                Spacer()
            }
            
            Button {
                UserDefaults.standard.set(true, forKey: "TermsAccepted")
                shouldShowTerms = false
            } label: {
                Text("알겠습니다! 🫡")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
        .interactiveDismissDisabled()
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
