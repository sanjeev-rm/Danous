//
//  SplitBillViewModel.swift
//  Danous
//
//  Created by Sanjeev RM on 06/01/24.
//

import Foundation
import SwiftUI

class SplitBillViewModel: ObservableObject {
    
    @Published var showAddNewPersonView: Bool = false
    @Published var totalAmountString: String = ""
    @Published var johnDoeAmount: String = ""
    
    @Published var members: [SplitBillMember] = [SplitBillMember(name: "John Doe", mobile: "9082883516", amountToPay: 0)]
}
