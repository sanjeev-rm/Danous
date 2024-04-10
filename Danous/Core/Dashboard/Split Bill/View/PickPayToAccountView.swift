//
//  PickPayToAccountView.swift
//  Danous
//
//  Created by Sanjeev RM on 24/02/24.
//

import SwiftUI

struct PickPayToAccountView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var splitBillViewModel: SplitBillViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                optionsList
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
        }
    }
}

extension PickPayToAccountView {
    
    private var optionsList: some View {
        List {
            NavigationLink {
                QRScannerView()
            } label: {
                Label("Scan QR", systemImage: "viewfinder")
                    .padding(8)
                    .font(.body)
                    .fontWeight(.regular)
            }
            .listRowBackground(Color(.systemBackground))
            
            NavigationLink {
                SearchContactOrNumberView(selectedUser: $splitBillViewModel.recentlySelectedPerson)
            } label: {
                Label("Search number or contact", systemImage: "magnifyingglass")
                    .padding(8)
                    .font(.body)
                    .fontWeight(.regular)
            }
            .listRowBackground(Color(.systemBackground))
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    PickPayToAccountView()
        .environmentObject(SplitBillViewModel())
}
