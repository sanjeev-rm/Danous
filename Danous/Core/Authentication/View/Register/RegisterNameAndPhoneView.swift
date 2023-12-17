//
//  RegisterNameAndPhoneView.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct RegisterNameAndPhoneView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State var name: String = ""
    @State var countryCode: String = ""
    @State var phone: String = ""
    
    @State var showOtpView: Bool = false
    
    var body: some View {
        VStack {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        inputFields
                        
                        Spacer()
                        
                        nextAndLoginButton
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
        .navigationDestination(isPresented: $showOtpView) {
            RegisterOtpView()
        }
    }
}

extension RegisterNameAndPhoneView {
    
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Welcome to Danous", subheadline: "Register to create your account")
    }
    
    private var phoneFields: some View {
        HStack(spacing: 16) {
            DanousTextField(value: $countryCode, label: "code", icon: Image(systemName: "plus"))
                .frame(width: 100)
            DanousTextField(value: $phone, label: "phone")
        }
        .keyboardType(.numberPad)
    }
    
    private var inputFields: some View {
        VStack {
            DanousTextField(value: $name, label: "Name")
            phoneFields
        }
        .padding(.vertical)
        .padding(.horizontal, 1)
    }
    
    private var nextAndLoginButton: some View {
        VStack {
            DanousBasicButton(label: "Next") {
                showOtpView = true
            }
            
            Button {
                authenticationViewModel.showSignUp = false
            } label: {
                HStack {
                    Text("Visiting again?")
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                    Text("Login")
                }
                .font(.callout)
            }
        }
    }
}

#Preview {
    RegisterNameAndPhoneView()
        .environmentObject(AuthenticationViewModel())
}
