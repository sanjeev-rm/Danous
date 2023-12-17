//
//  RegisterTermsAndConditionsView.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct RegisterTermsAndConditionsView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    var body: some View {
        VStack {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        content
                        
                        Spacer()
                        
                        agreeButton
                    }
                    .frame(minHeight: geometry.size.height)
                }
                .frame(width: geometry.size.width)
                .scrollBounceBehavior(.basedOnSize)
                .scrollDismissesKeyboard(.interactively)
            }
            .padding()
            .padding(.top, 16)
            .background(Color(.systemBackground))
        }
        .background {
            Image(danousImage: .backgroundImage)
                .resizable()
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

extension RegisterTermsAndConditionsView {
    
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Terms & Conditions", subheadline: "Agree to these terms and conditions to continue") {
            dismiss()
        }
    }
    
    private var content: some View {
        Text("Terms and Conditions")
            .font(.title2.monospaced())
            .foregroundStyle(.secondary)
    }
    
    private var agreeButton: some View {
        DanousBasicButton(label: "Agree") {
            authenticationViewModel.isLoggedIn = true
        }
    }
}

#Preview {
    RegisterTermsAndConditionsView()
}
