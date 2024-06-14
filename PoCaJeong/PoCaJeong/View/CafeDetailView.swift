//
//  CafeDetailView.swift
//  PoCaJeong
//
//  Created by 윤동주 on 6/15/24.
//

import SwiftUI

struct CafeDetailView: View {
    var cafe: Cafe
    var body: some View {
        VStack {
            Text(cafe.name)
        }
    }
}
