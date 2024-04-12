//
//  DashboardView.swift
//  Danous
//
//  Created by Sanjeev RM on 16/12/23.
//

import SwiftUI

struct DashboardView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    @State var showLoadingView: Bool = true
    @State var searchText: String = ""
    @State var userName: String = "John Doe"
    
    var body: some View {
        ZStack {
            if dashboardViewModel.showSearchView {
                SearchView(show: $dashboardViewModel.showSearchView)
            } else {
                VStack {
                    if showLoadingView {
                        Spacer()
                        progressView
                    } else {
                        dashboardBaseView
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background {
                    Image(danousImage: .backgroundImage)
                        .resizable()
                        .ignoresSafeArea()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            showLoadingView = false
                        }
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension DashboardView {
    
    private var progressView: some View {
        ProgressView()
            .tint(.white)
            .dynamicTypeSize(.accessibility1)
            .padding(44)
    }
    
    private var dashboardBaseView: some View {
        VStack {
            VStack(spacing: 44) {
                searchBarAndSettingsButton
                
                greetingTitle
                    .padding(.leading)
            }
            .padding()
            .padding(.bottom, 32)
            .foregroundStyle(.white)
            
            featuresGrid
        }
    }
    
    private var searchBarAndSettingsButton: some View {
        HStack(spacing: 16) {
            searchBar
                .onTapGesture {
                    withAnimation(.easeIn) {
                        dashboardViewModel.showSearchView = true
                    }
                }
            
            NavigationLink {
                SettingsView()
            } label: {
                Image(systemName: "gearshape.fill")
                    .foregroundStyle(Color(uiColor: .white))
                    .font(.title)
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search number or contact", text: $searchText)
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 32)
                .foregroundStyle(Color(uiColor: .tertiarySystemGroupedBackground))
        )
    }
    
    private var greetingTitle: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Greetings")
            Text(userName)
        }
        .font(.largeTitle.monospaced().bold())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var featuresGrid: some View {
        VStack(spacing: 64) {
            
            HStack {
                featureButton(feature: .scanQRCode) {
                    withAnimation(.easeIn) {
                        dashboardViewModel.showQRScannerView = true
                    }
                }
                Spacer()
                featureButton(feature: .payAContact) {
                    withAnimation(.easeIn) {
                        dashboardViewModel.showSearchView = true
                    }
                }
                Spacer()
                featureButton(feature: .payNumber) {
                    print("DEBUG: Pressed Pay number")
                }
            }
            
            HStack {
                featureButton(feature: .wallet) {
                    print("DEBUG: Pressed Wallet")
                }
                Spacer()
                featureButton(feature: .bankTransfer) {
                    print("DEBUG: Pressed Bank Trasfer")
                }
                Spacer()
                NavigationLink {
                    SplitBillView()
                        .onDisappear {
                            DanousUser.reloadSampleUsers()
                        }
                } label: {
                    featureButtonView(feature: .splitBill)
                }
            }
            
            HStack {
                featureButton(feature: .mobileRecharge) {
                    print("DEBUG: Pressed Mobile Recharge")
                }
                Spacer()
                featureButton(feature: .billPayment) {
                    print("DEBUG: Pressed Bill payment")
                }
                Spacer()
                featureButton(feature: .tickets) {
                    print("DEBUG: Pressed Tickets")
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
    }
    
    private func featureButton(feature: DashboardFeature, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            featureButtonView(feature: feature)
        }
    }
    
    private func featureButtonView(feature: DashboardFeature) -> some View {
        VStack(alignment: .center, spacing: 8) {
            feature.image
                .dynamicTypeSize(.accessibility1)
                .foregroundStyle(.accent)
            Text(feature.title)
                .font(.subheadline.bold())
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .frame(width: 80)
    }
}

#Preview {
    DashboardView()
        .environmentObject(DashboardViewModel())
}
