//
//  OnboardingView.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel
    
    @State var currentStep: OnboardingStep = .one
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                
                Rectangle()
                    .foregroundStyle(.background)
                    .frame(height: 350)
                
                TabView(selection: $currentStep,
                        content:  {
                    ForEach(OnboardingStep.allCases, id:\.self) { step in
                        OnboardingStepView(onboardingStep: step)
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                DanousBasicButton(label: currentStep == .three ? "Start now" : "Next") {
                    switch currentStep {
                    case .one: withAnimation(.easeIn) {currentStep = .two}
                    case .two: withAnimation(.easeIn) {currentStep = .three}
                    case .three: withAnimation(.easeIn) {
                        withAnimation(.default) {
                            authenticationViewModel.showOnboarding = false
                        }
                    }
                    }
                }
                .padding()
                .padding(.bottom, 32)
            }
            .ignoresSafeArea()
            .background {
                Image(danousImage: .backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    OnboardingProgressView(currentOnboardingStep: currentStep)
                        .padding(.leading, 8)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.default) {
                            authenticationViewModel.showOnboarding = false
                        }
                    } label: {
                        Text("Skip")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.5))
                            .padding(.trailing, 8)
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AuthenticationViewModel())
}
