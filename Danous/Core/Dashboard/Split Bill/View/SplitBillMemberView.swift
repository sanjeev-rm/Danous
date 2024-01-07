//
//  SplitBillMemberView.swift
//  Danous
//
//  Created by Sanjeev RM on 06/01/24.
//

import SwiftUI

struct SplitBillMemberView: View {
    
    @Binding var member: SplitBillMember
    @State var amountString: String = ""
    
    var randomColors: [UIColor] = [.systemBlue, .systemCyan, .systemPink, .systemGreen, .systemOrange, .systemYellow, .systemMint, .systemBrown, .systemPurple]
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .frame(width: 44)
                .foregroundStyle(Color(randomColors[member.profileColorId]).opacity(0.8))
            
            VStack(alignment: .leading) {
                Text(member.name)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text(member.mobile)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            HStack {
                Text("$")
                TextField("amount", text: $amountString, onEditingChanged: updateAmountValue)
                    .keyboardType(.decimalPad)
                    .frame(width: 80)
            }
            .fontDesign(.monospaced)
            .foregroundColor(.secondary)
        }
        .onAppear {
            amountString = "\(member.amountToPay)"
        }
    }
}

extension SplitBillMemberView {
    
    private func updateAmountValue(isFocused: Bool) {
        if !isFocused {
            guard let amountDouble = Double(amountString) else { return }
            member.amountToPay = amountDouble
            print("DEBUG: member amount = \(member.amountToPay), newValue = \(amountString)")
        }
    }
}

#Preview {
    SplitBillMemberView(member: .constant(SplitBillMember(name: "John Doe", mobile: "9082883516", amountToPay: 75.0)))
}
