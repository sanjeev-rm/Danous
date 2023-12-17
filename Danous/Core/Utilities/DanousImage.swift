//
//  DanousImage.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import Foundation
import SwiftUI

enum DanousImage: String {
    case backgroundImage = "image.background"
    case onboardingStep1Image = "image.onboarding.step1"
    case onboardingStep2Image = "image.onboarding.step2"
    case onboardingStep3Image = "image.onboarding.step3"
}

extension Image {
    init(danousImage: DanousImage) {
        self.init(danousImage.rawValue)
    }
}
