//
//  SearchPersonCardView.swift
//  Danous
//
//  Created by Sanjeev RM on 06/01/24.
//

import SwiftUI

struct PersonCardView: View {
    
    var randomColors: [UIColor] = [.systemBlue, .systemCyan, .systemPink, .systemGreen, .systemOrange, .systemYellow, .systemMint, .systemBrown, .systemPurple]
    
    @Binding var user: DanousUser
    
    var body: some View {
        HStack(spacing: 16) {
            Circle()
                .frame(width: 44)
                .foregroundStyle(Color(randomColors[Int.random(in: 0..<randomColors.count)]).opacity(0.8))
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.callout)
                    .fontWeight(.semibold)
                Text("\(user.mobile)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
    }
}

#Preview {
    PersonCardView(user: .constant(DanousUser(name: "Paris", mobile: "8765674093")))
}
