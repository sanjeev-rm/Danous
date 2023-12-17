//
//  OnboardingStepView.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import SwiftUI

struct OnboardingStepView: View {
    
    var onboardingStep: OnboardingStep
    
    var body: some View {
        ZStack(alignment: .center) {
            onboardingStep.image
                .offset(y: -80)
            
            VStack {
                Spacer()
                Rectangle()
                    .foregroundStyle(Color(uiColor: .systemBackground))
                    .frame(height: 350)
                    .overlay {
                        VStack(spacing: 32) {
                            
                            Text(onboardingStep.title)
                                .font(.title.bold())
                            
                            Text(onboardingStep.description)
                                .foregroundStyle(.secondary)
                            
                            Spacer()
                        }
                        .multilineTextAlignment(.center)
                        .padding(16)
                        .padding(.vertical, 32)
                    }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingStepView(onboardingStep: .one)
    }
}
