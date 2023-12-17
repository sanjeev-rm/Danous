//
//  AuthenticationViewModel.swift
//  Danous
//
//  Created by Sanjeev RM on 16/12/23.
//

import Foundation

class AuthenticationViewModel: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    @Published var showOnboarding: Bool = true
    
    @Published var showSignUp: Bool = false
}
