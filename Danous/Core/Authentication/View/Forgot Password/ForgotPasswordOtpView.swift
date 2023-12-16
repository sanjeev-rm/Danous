//
//  ForgotPasswordOtpView.swift
//  Danous
//
//  Created by Sanjeev RM on 14/12/23.
//

import SwiftUI

struct ForgotPasswordOtpView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var otp: String = ""
    @State var showResetPasswordView: Bool = false
    
    var body: some View {
        VStack {
            title
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        otpFieldAndResendOtpButton
                        
                        Spacer()
                        
                        nextButton
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
        .navigationDestination(isPresented: $showResetPasswordView) {
            ForgotPasswordResetPasswordView()
        }
    }
}

extension ForgotPasswordOtpView {
    
    private var title: some View {
        DanousAuthenticationPageTitle(headline: "Verify Phone", subheadline: "Enter the OTP received to your phone number") {
            dismiss()
        }
    }
    
    private var otpField: some View {
        DanousTextField(value: $otp, label: "OTP")
            .keyboardType(.numberPad)
    }
    
    private var resendOtpButton: some View {
        Button {} label: {
            Text("Resend OTP")
                .font(.callout)
        }
    }
    
    private var otpFieldAndResendOtpButton: some View {
        VStack {
            otpField
                .padding(.vertical)
                .padding(.horizontal, 1)
            
            resendOtpButton
        }
    }
    
    private var nextButton: some View {
        DanousBasicButton(label: "Next") {
            showResetPasswordView = true
        }
    }
}

#Preview {
    NavigationStack {
        ForgotPasswordOtpView()
    }
}
