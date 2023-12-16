//
//  RegisterSetPasswordView.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct RegisterSetPasswordView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @State var showTAndCView: Bool = false
    
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
        .navigationDestination(isPresented: $showTAndCView) {
            RegisterTermsAndConditionsView()
        }
    }
}

extension RegisterSetPasswordView {
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Create Password", subheadline: "Enter your password") {
            dismiss()
        }
    }
    
    private var passwordFields: some View {
        VStack {
            DanousSecureField(value: $password, label: "Password")
            DanousSecureField(value: $confirmPassword, label: "Confirm password", hideUnlockButton: true)
        }
        .padding(.vertical)
        .padding(.horizontal, 1)
    }
    
    private var resetButton: some View {
        DanousBasicButton(label: "Register") {
            showTAndCView = true
        }
    }
}

#Preview {
    RegisterSetPasswordView()
}
