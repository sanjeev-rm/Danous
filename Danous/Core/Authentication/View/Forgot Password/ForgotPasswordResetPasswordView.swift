//
//  ForgotPasswordResetPasswordView.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct ForgotPasswordResetPasswordView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        passwordFields
                        
                        Spacer()
                        
                        resetButton
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

extension ForgotPasswordResetPasswordView {
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Reset Password", subheadline: "Enter your new password") {
            dismiss()
        }
    }
    
    private var passwordFields: some View {
        VStack {
            DanousSecureField(value: $password, label: "New password")
            DanousSecureField(value: $confirmPassword, label: "Confirm password", hideUnlockButton: true)
        }
        .padding(.vertical)
        .padding(.horizontal, 1)
    }
    
    private var resetButton: some View {
        DanousBasicButton(label: "Update") {}
    }
}

#Preview {
    ForgotPasswordResetPasswordView()
}
