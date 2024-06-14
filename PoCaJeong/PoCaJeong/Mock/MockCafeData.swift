//
//  MockCafeData.swift
//  PoCaJeong
//
//  Created by 윤동주 on 6/15/24.
//

import Foundation

final class MockCafeData {
    static var cafes: [Cafe] = [
        Cafe(name: "위트리", wifiSpeed: 60.7, consent: 0.7, eyeContact: 2, songStyle: .balad, memo: "아잉 몰라잉 언제오는겨"),
        Cafe(name: "유트리", wifiSpeed: 70.7, consent: 1.2, eyeContact: 5, songStyle: .hiphop, memo: "아잉 몰라잉 언제오는겨2"),
        Cafe(name: "쉬트리", wifiSpeed: 200.7, consent: 0.3, eyeContact: 4, songStyle: .dance, memo: "아잉 몰라잉 언제오는겨3"),
    ]
}
