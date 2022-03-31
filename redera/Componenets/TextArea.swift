//
//  TextArea.swift
//  redera
//
//  Created by Zayn on 3/20/22.
//

import SwiftUI

struct TextArea: View {
    
    @Binding var text: String
    let placeholder: String
    
    init(_ placeholder: String, _ text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            if text.isEmpty {
            Text(placeholder)
                .foregroundColor(Color(.placeholderText))
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                
            }
            TextEditor(text: $text)
            
        }
        .font(.body)
    }
}


