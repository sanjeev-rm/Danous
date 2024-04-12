//
//  DashboardBaseView.swift
//  Danous
//
//  Created by Sanjeev RM on 05/01/24.
//

import SwiftUI

struct DashboardBaseView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    var body: some View {
        NavigationStack {
            DashboardView()
                .navigationDestination(isPresented: $dashboardViewModel.showQRScannerView) {
                    QRScannerView()
                }
        }
    }
}

#Preview {
    DashboardBaseView()
        .environmentObject(DashboardViewModel())
}
