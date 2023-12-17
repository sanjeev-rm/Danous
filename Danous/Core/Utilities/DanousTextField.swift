//
//  DanousTextField.swift
//  Danous
//
//  Created by Sanjeev RM on 13/12/23.
//

import SwiftUI

struct DanousTextField: View {
    
    @Binding var value: String
    var label: String
    var icon: Image?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                if let icon = icon {
                    icon
                        .dynamicTypeSize(.small)
                        .foregroundStyle(.secondary.opacity(0.8))
                }
                TextField(label, text: $value, prompt: Text(""))
            }
            .frame(height: 24)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(.secondary.opacity(0.8))
            }
            
            Text(label)
                .padding(.horizontal, 8)
                .background(Color(.systemBackground))
                .foregroundStyle(.secondary.opacity(0.8))
                .offset(y: -65)
        }
    }
}

#Preview {
    DanousTextField(value: .constant("value"), label: "label", icon: Image(systemName: "plus"))
}
