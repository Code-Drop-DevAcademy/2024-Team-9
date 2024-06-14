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

enum SongStyleType {
    case classic
    case hiphop
    case indie
    case dance
    case RnB
    case balad
    case popSong
}
