//
//  InputContentsView.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI

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
    
    let sample: [String] = ["00", "01", "02"]
    
    
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
                            
                            Text("\(wifiSpeed) Mbps")
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
                                showConcentPicker.toggle()
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
                                showNunchiPicker.toggle()
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
