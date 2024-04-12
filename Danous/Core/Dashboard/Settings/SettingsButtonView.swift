//
//  SettingsButtonView.swift
//  Danous
//
//  Created by Sanjeev RM on 11/04/24.
//

import SwiftUI

struct SettingsButtonView: View {
    
    var text: String = ""
    var imageSystemName: String = ""
    var showNavigationIcon: Bool = true
    var isDestructive: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .foregroundStyle(isDestructive ? .red.opacity(01) : .accent)
                .font(.callout)
            Text(text)
                .font(.callout.bold())
            
            Spacer()
        }
        .foregroundColor(isDestructive ? .red.opacity(01) : .primary.opacity(0.6))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .cornerRadius(8)
        .frame(height: 52)
    }
}

#Preview {
    VStack {
        SettingsButtonView(text: "Click me", imageSystemName: "hand.point.up.left.fill")
        SettingsButtonView(text: "log out", imageSystemName: "send", showNavigationIcon: false, isDestructive: true)
    }
}
