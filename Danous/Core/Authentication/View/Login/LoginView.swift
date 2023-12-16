//
//  LoginView.swift
//  Danous
//
//  Created by Sanjeev RM on 13/12/23.
//

import SwiftUI

struct LoginView: View {
    
    @State var countryCode: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        inputFields
                        
                        Spacer()
                        
                        loginAndRegisterButtons
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
    }
}

extension LoginView {
    
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Welcome back to Danous", subheadline: "Login to your account")
    }
    
    private var phoneFields: some View {
        HStack(spacing: 16) {
            DanousTextField(value: $countryCode, label: "code", icon: Image(systemName: "plus"))
                .frame(width: 100)
            DanousTextField(value: $phone, label: "phone")
        }
        .keyboardType(.numberPad)
    }
    
    private var passwordField: some View {
        VStack(spacing: 0) {
            DanousSecureField(value: $password, label: "password")
            
            Button {
                // to forgot assword page
            } label: {
                Text("Forgot password ?")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    private var inputFields: some View {
        VStack(spacing: 32) {
            phoneFields
            
            passwordField
        }
        .padding(.vertical)
        .padding(.horizontal, 1)
    }
    
    private var loginAndRegisterButtons: some View {
        VStack {
            DanousBasicButton(label: "Login") {}
            Button {} label: {
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                    Text("Register")
                }
                .font(.callout)
            }
        }
    }
}

#Preview {
    LoginView()
}
