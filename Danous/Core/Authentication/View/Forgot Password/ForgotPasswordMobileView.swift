//
//  ForgotPasswordMobileView.swift
//  Danous
//
//  Created by Sanjeev RM on 13/12/23.
//

import SwiftUI

struct ForgotPasswordMobileView: View {
    
    @State var countryCode: String = ""
    @State var phone: String = ""
    @State var otp: String = ""
    
    @State var showVerifyPhone: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                title
                
                GeometryReader { geometry in
                    ScrollView(showsIndicators: false) {
                        VStack {
                            inputFields
                            
                            Spacer()
                            
                            getOTPAndLoginButtons
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
            .navigationDestination(isPresented: $showVerifyPhone) {
                ForgotPasswordOtpView()
            }
        }
    }
}

extension ForgotPasswordMobileView {
    
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Forgot Password", subheadline: "Enter and verify your phone number to reset password")
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
        phoneFields
            .padding(.vertical)
            .padding(.horizontal, 1)
    }
    
    private var getOTPAndLoginButtons: some View {
        VStack {
            DanousBasicButton(label: "Get OTP") {
                showVerifyPhone = true
            }
            
            Button {} label: {
                HStack {
                    Text("Remembered the password?")
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                    Text("Login")
                }
                .font(.callout)
            }
        }
    }
}

#Preview {
    ForgotPasswordMobileView()
}
