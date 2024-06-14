//
//  InputContentsView.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI

enum MusicStyle: String, CaseIterable, Identifiable {
    case hiphop, kPop, ballad, piano
    var id: Self { self }
}

struct InputContentsView: View {
    @State private var cafeName: String = ""
    @State private var wifiSpeed: String = ""
    @State private var concent: String = "00"
    @State private var nunchi: String = "00"
    
    let sample: [String] = ["00", "01", "02"]
    @State private var musicStyle: MusicStyle = .hiphop
    
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
                            
                            Text("000 Mbps")
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("콘센트")
                            Spacer()
                            Text("1명당 콘센트 \(concent)개")
                        }
                        
                        Picker("1명당 콘센트 00개", selection: $concent) {
                            ForEach(sample, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Section {
                        HStack {
                            Text("눈치")
                            Spacer()
                            Text("사장님과 눈 마주친 횟수 \(nunchi)번")
                        }
                        
                        Picker("1명당 콘센트 00개", selection: $nunchi) {
                            ForEach(sample, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    
                    Section {
                        HStack {
                            Text("노래 스타일")
                            Spacer()
                            Picker("", selection: $musicStyle) {
                                ForEach(MusicStyle.allCases) { music in
                                    Text(music.rawValue)
                                }
                            }
                        }
                    }
                    
                    Section {
                        Text("사진 추가 ...")
                    }
                    
                    Section {
                        TextEditor(text: .constant("Placeholder"))
                            .frame(height: 172)
                    }
                }
            }
            .navigationTitle("InputContentsView")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading, content: {
                    Button(action: {
                        
                    }, label: {
                        Text("취소")
                    })
                })
                
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        
                    }, label: {
                        Text("추가")
                    })
                })
            }
        }
    }
}

#Preview {
    InputContentsView()
}
