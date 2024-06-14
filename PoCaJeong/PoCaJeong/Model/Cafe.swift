//
//  Cafe.swift
//  PoCaJeong
//
//  Created by 윤동주 on 6/15/24.
//

import Foundation

final class Cafe: Identifiable {
    var id = UUID()
    var name: String
    var wifiSpeed: Double
    var consent: Double
    var eyeContact: Int
    var songStyle: SongStyleType
    var memo: String
    
    init(id: UUID = UUID(), name: String, wifiSpeed: Double, consent: Double, eyeContact: Int, songStyle: SongStyleType, memo: String) {
        self.id = id
        self.name = name
        self.wifiSpeed = wifiSpeed
        self.consent = consent
        self.eyeContact = eyeContact
        self.songStyle = songStyle
        self.memo = memo
    }
}

enum SongStyleType: String, Identifiable, CaseIterable{
    case none = "없음"
    case classic = "클래식"
    case hiphop = "힙합"
    case indie = "인디"
    case dance = "댄스"
    case RnB = "R&B"
    case balad = "발라드"
    case popSong = "팝송"
    
    var id: Self { self }
}
