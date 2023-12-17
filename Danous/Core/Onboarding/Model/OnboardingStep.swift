//
//  OnboardingStep.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import Foundation
import SwiftUI

enum OnboardingStep: CaseIterable {
    case one
    case two
    case three
    
    var image: Image {
        switch self {
        case .one: return Image(danousImage: .onboardingStep1Image)
        case .two: return Image(danousImage: .onboardingStep2Image)
        case .three: return Image(danousImage: .onboardingStep3Image)
        }
    }
    
    var title: String {
        switch self {
        case .one: return "Create your digital wallet"
        case .two: return "Instant money transfers"
        case .three: return "Seamless QR code payments"
        }
    }
    
    var description: String {
        switch self {
        case .one: return "You can create your digital wallet where you can securely store and manage your funds."
        case .two: return "Swiftly send money between accounts with just a few taps in seconds"
        case .three: return "Effortlessly scan and pay instantly using our QR code feature."
        }
    }
}
