//
//  InputContentsView.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI
import PhotosUI

struct InputContentsView: View {
    // 카페 이름
    @State private var cafeName: String = ""
    
    // 와이파이 속도
    @State private var wifiSpeed: Double = 11.16
    
    // 1명당 콘센트 개수
    @State private var concent: Int = 0
    @State private var showConcentPicker: Bool = false
    
    // 사장님과 눈 마주친 횟수
    @State private var nunchi: Int = 0
    @State private var showNunchiPicker: Bool = false
    
    // 노래 스타일
    @State private var musicStyle: SongStyleType?
    
    // 사진 추가
    @State private var pickedPhoto: PhotosPickerItem?
    
    // 메모
    @State private var memoText: String = ""
    private let memoPlaceHolder: String = "추천 메뉴, 카페 분위기 ..."
    
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        TextField("카페 이름", text: $cafeName)
                    }
                    
                    Section {
                        HStack {
                            Text("Wi-fi")
                            
                            Spacer()
                            
                            Text("\(String(format: "%.2f", wifiSpeed)) Mbps")
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    let isTenConcent: Bool = concent == 10
                    let isTenNunchi: Bool = nunchi == 10
                    
                    Section {
                        HStack {
                            Text("콘센트")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showConcentPicker.toggle()
                                }
                            }, label: {
                                Text(isTenConcent ? "1명당 콘센트 \(concent)개" : "1명당 콘센트 0\(concent)개")
                                    .foregroundStyle(showConcentPicker ? .pink : .black)
                                
                            })
                            .buttonStyle(.bordered)
                        }
                        
                        if showConcentPicker {
                            Picker("", selection: $concent) {
                                ForEach(0..<11) { index in
                                    if index == 10 {
                                        Text("\(index)")
                                    }
                                    else {
                                        Text("0\(index)")
                                    }
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("눈치")
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    showNunchiPicker.toggle()
                                }
                            }, label: {
                                Text(isTenNunchi ? "사장님과 눈 마주친 횟수 \(nunchi)번" : "사장님과 눈 마주친 횟수 0\(nunchi)번")
                                    .foregroundStyle(showNunchiPicker ? .pink : .black)
                            })
                            .buttonStyle(.bordered)
                        }
                        
                        if showNunchiPicker {
                            Picker("", selection: $nunchi) {
                                ForEach(0..<11) { index in
                                    if index == 10 {
                                        Text("\(index)")
                                    }
                                    else {
                                        Text("0\(index)")
                                    }
                                }
                            }
                            .pickerStyle(.wheel)
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("노래 스타일")
                            
                            Spacer()
                            
                            Picker("", selection: $musicStyle) {
                                if musicStyle == nil {
                                    Text("없음")
                                }
                                Divider()
                                
                                Section {
                                    ForEach(SongStyleType.allCases) { music in
                                        Text(music.rawValue)
                                    }
                                }
                            }
                        }
                    }
                    
                    Section {
                        Text("Image File Name")
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button("Delete", role: .destructive) {
                                    
                                }
                            }
                        PhotosPicker(selection: $pickedPhoto, matching: .images) {
                            Text("사진 추가 ...")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Section {
                        TextEditor(text: $memoText)
                            .customStyleEditor(placeholder: memoPlaceHolder, userInput: $memoText)
                            .frame(height: 172)
                    }
                }
            }
            .navigationTitle("InputContentsView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("취소")
                    })
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        isPresented.toggle()
                    }, label: {
                        Text("추가")
                    })
                })
            }
        }
    }
}

