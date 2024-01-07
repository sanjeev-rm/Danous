//
//  SplitBillMember.swift
//  Danous
//
//  Created by Sanjeev RM on 06/01/24.
//

import Foundation
import SwiftUI

struct SplitBillMember: Hashable {
    
    var name: String
    var mobile: String
//    var image: Image? // Not working because it's not hashable so can't use it in ForEach
    var profileColorId: Int = Int.random(in: 0..<9)
    var amountToPay: Double
}
