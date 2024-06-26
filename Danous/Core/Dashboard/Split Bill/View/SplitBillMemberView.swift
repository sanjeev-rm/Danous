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
            PersonCardView(user: .constant(DanousUser(name: member.name, mobile: member.mobile)))
            
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
        }
    }
}

#Preview {
    SplitBillMemberView(member: .constant(SplitBillMember(name: "John Doe", mobile: "9082883516", amountToPay: 75.0)))
}
