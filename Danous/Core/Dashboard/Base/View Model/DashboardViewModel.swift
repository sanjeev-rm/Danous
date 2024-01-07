//
//  DashboardViewModel.swift
//  Danous
//
//  Created by Sanjeev RM on 16/12/23.
//

import Foundation

class DashboardViewModel: ObservableObject {
    
    @Published var showSearchView: Bool = false
    @Published var showSplitBillView: Bool = false
}
