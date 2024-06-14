//
//  CafeListView.swift
//  PoCaJeong
//
//  Created by 윤동주 on 6/15/24.
//

import SwiftUI

struct CafeListView: View {
    @State var cafes = MockCafeData.cafes
    @State var isInputContentsViewShown = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "F2F2F7")
                    .ignoresSafeArea()
                VStack {
                    List(cafes) { cafe in
                        NavigationLink {
                            CafeDetailView(cafe: cafe)
                        } label: {
                            Text(cafe.name)
                        }
                    }
                    Spacer()
                }
                .padding(.top, 18)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isInputContentsViewShown = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .navigationTitle("CafeListView")
            .toolbarBackground(.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $isInputContentsViewShown) {
                InputContentsView(isPresented: $isInputContentsViewShown)
            }
        }
    }
}

#Preview {
    CafeListView()
}
