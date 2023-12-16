//
//  OnboardingStepView.swift
//  Danous
//
//  Created by Sanjeev RM on 12/12/23.
//

import SwiftUI

struct OnboardingStepView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack {
                    Spacer()
                    Rectangle()
                        .foregroundStyle(.background)
                        .frame(height: 350)
                        .overlay {
                            VStack(spacing: 32) {
                                
                                Text("Create your digital wallet")
                                    .font(.title.bold())
                                
                                Text("You can create your digital wallet, where you can securely store and manage your funds.")
                                    .foregroundStyle(.secondary)
                                
                                Spacer()
                                
                                Button {
                                } label: {
                                    Text("Next")
                                        .font(.title3.bold())
                                        .padding(8)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(.borderedProminent)
                            }
                            .multilineTextAlignment(.center)
                            .padding(16)
                            .padding(.vertical, 32)
                        }
                }
                .ignoresSafeArea()
            }
            .background {
                Image("image3", bundle: nil)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    ProgressView()
                        .foregroundStyle(.background)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Skip")
                        .font(.callout)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

#Preview {
    OnboardingStepView()
}
