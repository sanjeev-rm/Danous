//
//  DanousAuthenticationPageTitle.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct DanousAuthenticationPageTitle: View {
    
    @State var headline: String
    @State var subheadline: String
    var backButtonAction: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 22) {
            
            if let backButtonAction = backButtonAction {
                Button {
                    backButtonAction()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.white)
                        .dynamicTypeSize(.accessibility1)
                }
            }
            
            Text(headline)
                .font(.system(.largeTitle, design: .default, weight: .bold))
                .foregroundStyle(.white)
            
            Text(subheadline)
                .font(.system(.callout, design: .default, weight: .regular))
                .foregroundStyle(.white.opacity(0.8))
        }
        .padding(16)
        .frame(height: 200)
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(.black)
    }
}

#Preview {
    DanousAuthenticationPageTitle(headline: "Headline", subheadline: "Enter and verify your phone number to reset password") {
        print("Back button tapped!")
    }
}
