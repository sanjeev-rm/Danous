//
//  SettingsView.swift
//  Danous
//
//  Created by Sanjeev RM on 11/04/24.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var authVM: AuthenticationViewModel
    @EnvironmentObject var dashboardVM: DashboardViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            
            nameAndMobile
                .padding(.bottom, 32)
            
            yourQRCode
            
            supportSection
            
            logoutButton
            
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension SettingsView {
    
    private var nameAndMobile: some View {
        Button {
        } label: {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("John Doe")
                        .font(.title2.bold())
                    Text("+91 9082883537")
                        .font(.callout)
                        .fontWeight(.regular)
                        .fontDesign(.monospaced)
                        .foregroundStyle(.secondary)
                }
                .foregroundColor(.primary)
                
                Spacer()
                
                Circle()
                    .foregroundColor(.clear)
                    .overlay {
                        AsyncImage(url: nil) {image in
                            image
                        } placeholder: {
                            Color.accentColor
                                .opacity(0.3)
                        }
                        .clipShape(Circle())
                    }
                    .frame(height: 52)
            }
            
        }
        
    }
    
    private var yourQRCode: some View {
        Group {
            NavigationLink {
            } label: {
                SettingsButtonView(text: "Your QR code", imageSystemName: "qrcode", showNavigationIcon: true, isDestructive: false)
            }
        }
    }
    
    private var supportSection: some View {
        
        Group {
            NavigationLink {
            } label: {
                SettingsButtonView(text: "Help center", imageSystemName: "list.clipboard.fill", showNavigationIcon: true, isDestructive: false)
            }
            
            NavigationLink {
            } label: {
                SettingsButtonView(text: "Report a bug", imageSystemName: "flag.fill", showNavigationIcon: true, isDestructive: false)
            }
            
            NavigationLink {
            } label: {
                SettingsButtonView(text: "Write a review", imageSystemName: "pencil.line", showNavigationIcon: true, isDestructive: false)
            }
        }
    }
    
    private var logoutButton: some View {
        Group {
            Button {
                withAnimation(.easeOut) {
                    dismiss()
                    authVM.isLoggedIn = false
                }
            } label: {
                SettingsButtonView(text: "logout", imageSystemName: "rectangle.portrait.and.arrow.right", showNavigationIcon: false, isDestructive: true)
            }
        }
    }
}

#Preview {
    NavigationView {
        SettingsView()
    }
}
