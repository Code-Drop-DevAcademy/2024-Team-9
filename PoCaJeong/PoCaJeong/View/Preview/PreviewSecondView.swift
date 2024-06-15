//
//  PreviewSecondView.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI

struct PreviewSecondView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.test)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            RoundedRectangle(cornerRadius: 32)
                .frame(width: 356, height: 320)
                .foregroundStyle(.primaryIvory)
                .overlay(alignment: .top) {
                    VStack {
                        HStack {
                            Text("와이파이 속도")
                                .font(.pretendardB18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                            
                            Spacer()
                            
                            Text("83 Mbps")
                                .font(.pretendardR18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                        }
                        .padding(.bottom, 4)
                        
                        HStack {
                            Text("콘센트")
                                .font(.pretendardB18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                            
                            Spacer()
                            
                            Text("1명당 콘센트 03개")
                                .font(.pretendardR18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                        }
                        .padding(.bottom, 4)
                        
                        HStack {
                            Text("눈치")
                                .font(.pretendardB18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                            
                            Spacer()
                            
                            Text("사장님과 눈 마주친 횟수 10번")
                                .font(.pretendardR18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                        }
                        .padding(.bottom, 4)
                        
                        HStack {
                            Text("노래 스타일")
                                .font(.pretendardB18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                            
                            Spacer()
                            
                            Text("팝송")
                                .font(.pretendardR18)
                                .kerning(-1)
                                .foregroundStyle(.primaryRed)
                        }
                        .padding(.bottom, 14)
                        
                        Text("낮은 곳에 살고 싶었다 낮은 곳이라면 지상의 어디라도 좋다 찰랑찰랑 물처럼 고여들 네 사랑을 온몸으로 받아들일 수 있다면 한방울도 헛되이 새어 나가지 않게 할 수만 있다면 그래, 내가 낮은 곳에 있겠다는 건 너를 위해 나를 온전히 비우겠다는 뜻이다")
                            .font(.pretendardR14)
                            .kerning(-1)
                    }
                    .padding(.top, 32)
                    .padding(.horizontal, 32)
                }
                .overlay(alignment: .bottomLeading) {
                    RoundedRectangle(cornerRadius: 32)
                        .frame(width: 172, height: 60)
                        .foregroundStyle(.primaryRed)
                        .overlay {
                            Text("OurDays")
                                .font(.pretendardBlack32)
                                .kerning(-1)
                                .foregroundStyle(.primaryIvory)
                        }
                }
                .padding(.bottom, 16)
        }
    }
}

#Preview {
    PreviewSecondView()
}
