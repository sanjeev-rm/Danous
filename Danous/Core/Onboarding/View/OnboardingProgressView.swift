//
//  OnboardingProgressView.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import SwiftUI

struct OnboardingProgressView: View {
    var currentOnboardingStep: OnboardingStep
    var body: some View {
        HStack {
            ForEach(OnboardingStep.allCases, id: \.self) { onboardingStep in
                let isPresenting = (currentOnboardingStep == onboardingStep)
                RoundedRectangle(cornerRadius: 32)
                    .frame(width: isPresenting ? 20 : 10, height: 8)
                    .foregroundColor(isPresenting ? .accentColor : .white.opacity(0.5))
            }
        }
    }
}

#Preview {
    OnboardingProgressView(currentOnboardingStep: .one)
}
