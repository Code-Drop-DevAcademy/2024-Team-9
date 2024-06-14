//
//  CustomTextEditorStyle.swift
//  PoCaJeong
//
//  Created by Seoyeon Choi on 6/15/24.
//

import SwiftUI

struct CustomTextEditorStyle: ViewModifier {
    let placeholder: String
    @Binding var text: String
    @Binding var isEditing: Bool
    
    func body(content: Content) -> some View {
        content
            .background(alignment: .topLeading) {
                if text.isEmpty && !isEditing {
                    Text(placeholder)
                        .foregroundStyle(.secondary)
                }
            }
            .textInputAutocapitalization(.none) // 첫 시작 대문자 막기
            .autocorrectionDisabled()
            .scrollContentBackground(.hidden)
            .overlay(alignment: .bottomTrailing) {
                Text("\(text.count) / 163")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                    .onChange(of: text) { oldValue, newValue in
                        if newValue.count > 126 {
                            text = String(newValue.prefix(163))
                        }
                    }
            }
    }
}

extension TextEditor {
    func customStyleEditor(placeholder: String, userInput: Binding<String>, isEditing: Binding<Bool>) -> some View {
        self.modifier(CustomTextEditorStyle(placeholder: placeholder, text: userInput, isEditing: isEditing))
    }
}
