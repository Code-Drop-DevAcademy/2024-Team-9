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
                Color(.primaryPink)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: 276, height: 60)
                        .padding(.leading, 16)
                        .foregroundStyle(.primaryBlue)
                        .overlay {
                            Text("카공하기 좋은 카페")
                                .font(.pretendardBlack32)
                                .kerning(-1)
                                .foregroundStyle(.white)
                        }
                    
                    List(cafes) { cafe in
                        NavigationLink {
                            CafeDetailView(cafe: cafe)
                        } label: {
                            Text(cafe.name)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                
                            } label: {
                                Label("삭제", systemImage: "trash")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    
                    Spacer()
                }
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
            .sheet(isPresented: $isInputContentsViewShown) {
                InputContentsView(isPresented: $isInputContentsViewShown)
            }
        }
    }
}

#Preview {
    CafeListView()
}
