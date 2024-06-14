//
//  InputContentsView.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI
import PhotosUI
import Network

struct InputContentsView: View {
    // 카페 이름
    @State private var cafeName: String = ""
    
    // 와이파이 속도
    @State private var wifiSpeed: Double = 0
    @ObservedObject var viewModel = NetworkSpeedTest()
    @State private var isLoading: Bool = false
    
    // 1명당 콘센트 개수
    @State private var concent: Int = 0
    @State private var showConcentPicker: Bool = false
    
    // 사장님과 눈 마주친 횟수
    @State private var nunchi: Int = 0
    @State private var showNunchiPicker: Bool = false
    
    // 노래 스타일
    @State private var musicStyle: SongStyleType = .none
    
    // 사진 추가
    @State private var pickedPhoto: PhotosPickerItem? = nil
    @State private var image: Image? = nil
    
    // 테마 선택
    @State private var showThemeColor: Bool = false
    
    // 메모
    @State private var memoText: String = ""
    @State private var isEditing: Bool = false
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
                            
                            if isLoading {
                                ProgressView("is Loading ...")
                                    .progressViewStyle(CircularProgressViewStyle())
                            } else {
                                if let downloadSpeed = viewModel.downloadSpeed {
                                    Text(String(format: "%.2f Mbps", downloadSpeed))
                                        .foregroundStyle(.secondary)
                                } else {
                                    Text("No connection")
                                }
                            }
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
                                Text(SongStyleType.none.rawValue)
                                    .tag(SongStyleType.none)
                                
                                Divider()
                                
                                ForEach(SongStyleType.allCases.filter { $0 != .none }, id: \.self) { music in
                                    Text(music.rawValue)
                                        .tag(music)
                                }
                                .pickerStyle(.menu)
                            }
                        }
                    }
                    
                    Section {
                        if let image = image {
                            PhotosPicker(selection: $pickedPhoto, matching: .images) {
                                HStack {
                                    Text("추가된 이미지")
                                        .foregroundStyle(.black)
                                    
                                    Spacer()
                                    
                                    image
                                        .resizable()
                                        .frame(width: 49, height: 38)
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 6))
                                }
                                .onChange(of: pickedPhoto) { oldItem, newItem in
                                    loadImage(from: newItem)
                                }
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    clearImage()
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                            }
                        } else {
                            PhotosPicker(selection: $pickedPhoto, matching: .images) {
                                Text("사진 추가 ...")
                                    .foregroundStyle(.black)
                            }
                            .onChange(of: pickedPhoto) { oldItem, newItem in
                                loadImage(from: newItem)
                            }
                        }
                    }
                    
                    Section {
                        HStack {
                            Text("테마 선택")
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 22, height: 22)
                            
                            Button(action: {
                                showThemeColor.toggle()
                            }, label: {
                                Image(systemName: showThemeColor ? "chevron.up" : "chevron.down")
                                    .foregroundStyle(.secondary)
                            })
                            .buttonStyle(.plain)
                        }
                        
                        if showThemeColor {
                            Text("")
                        }
                    }
                    
                    Section {
                        TextEditor(text: $memoText)
                            .customStyleEditor(placeholder: memoPlaceHolder, userInput: $memoText, isEditing: $isEditing)
                            .frame(height: 191)
                            .onTapGesture {
                                isEditing = true
                            }
                            .onSubmit {
                                isEditing = false
                            }
                    }
                }
                .onReceive(viewModel.$downloadSpeed) { speed in
                    isLoading = speed == nil // 다운로드 속도가 측정 중인 동안에만 로딩 표시
                }
                .onAppear {
                    viewModel.startMonitoring()
                }
                .navigationTitle("카공하기 좋은 카페 추가")
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
    private func clearImage() {
        image = nil
        pickedPhoto = nil
    }
    
    private func loadImage(from item: PhotosPickerItem?) {
        guard let item = item else {
            image = nil
            return
        }
        
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    image = Image(uiImage: uiImage)
                }
            }
        }
    }
}

