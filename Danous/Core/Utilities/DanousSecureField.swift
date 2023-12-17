//
//  DanousSecureField.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct DanousSecureField: View {
    
    @Binding var value: String
    var label: String
    var hideUnlockButton: Bool = false
    
    @State private var showValue: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                if showValue {
                    TextField(label, text: $value, prompt: Text(""))
                } else {
                    SecureField(label, text: $value, prompt: Text(""))
                }
                
                if !hideUnlockButton {
                    Button {
                        showValue.toggle()
                    } label: {
                        if showValue {
                            Image(systemName: "lock.open.fill")
                        } else {
                            Image(systemName: "lock.fill")
                        }
                    }
                }
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
    DanousSecureField(value: .constant("value"), label: "label", hideUnlockButton: true)
}
