//
//  SplitActivatedView.swift
//  Danous
//
//  Created by Sanjeev RM on 07/01/24.
//

import SwiftUI

struct SplitActivatedView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        VStack(spacing: 64) {
            
            checkmark
            
            heading
            
            instructionText
            
            dashboardButton
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(danousImage: .backgroundImage)
                .resizable()
                .ignoresSafeArea()
        }
    }
}

extension SplitActivatedView {
    
    private var checkmark: some View {
        Image(systemName: "checkmark")
            .dynamicTypeSize(.accessibility5)
            .font(.largeTitle.bold())
            .foregroundColor(.green)
            .padding()
            .background(
                Circle()
                    .foregroundColor(Color(.systemBackground))
            )
    }
    
    private var heading: some View {
        Text("Split Activated !")
            .font(.largeTitle.bold())
            .fontDesign(.default)
            .foregroundStyle(.white)
    }
    
    private var instructionText: some View {
        Text("Navigate to the dashboard of the app to make the payment")
            .multilineTextAlignment(.center)
            .font(.system(.headline, design: .monospaced, weight: .regular))
            .foregroundStyle(.white)
    }
    
    private var dashboardButton: some View {
        Button {
            dashboardViewModel.showSplitBillView = false
            DanousUser.reloadSampleUsers()
        } label: {
            Text("Go to dashboard")
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                )
        }
    }
}

#Preview {
    SplitActivatedView()
        .environmentObject(DashboardViewModel())
}
