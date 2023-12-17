//
//  DanousApp.swift
//  Danous
//
//  Created by Sanjeev RM on 09/12/23.
//

import SwiftUI

@main
struct DanousApp: App {
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var dashboardViewModel = DashboardViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            if !authenticationViewModel.isLoggedIn && authenticationViewModel.showOnboarding {
                OnboardingView()
                    .environmentObject(authenticationViewModel)
            } else if !authenticationViewModel.isLoggedIn && !authenticationViewModel.showOnboarding && !authenticationViewModel.showSignUp {
                LoginView()
                    .environmentObject(authenticationViewModel)
                    .environmentObject(loginViewModel)
            } else if !authenticationViewModel.isLoggedIn && !authenticationViewModel.showOnboarding && authenticationViewModel.showSignUp {
                RegisterView()
                    .environmentObject(authenticationViewModel)
                    .environmentObject(loginViewModel)
            } else if authenticationViewModel.isLoggedIn {
                DashboardView()
                    .environmentObject(authenticationViewModel)
                    .environmentObject(dashboardViewModel)
            }
        }
    }
}
