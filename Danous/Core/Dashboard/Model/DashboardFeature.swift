//
//  DashboardView.swift
//  Danous
//
//  Created by Sanjeev RM on 03/01/24.
//

import Foundation
import SwiftUI

enum DashboardFeature {
    
    case scanQRCode
    case payAContact
    case payNumber
    case wallet
    case bankTransfer
    case splitBill
    case mobileRecharge
    case billPayment
    case tickets
    
    var image: Image {
        switch self {
        case .scanQRCode: Image(systemName: "qrcode.viewfinder")
        case .payAContact: Image(systemName: "person.crop.circle.badge.plus")
        case .payNumber: Image(systemName: "phone.fill")
        case .wallet: Image(systemName: "wallet.pass.fill")
        case .bankTransfer: Image(systemName: "arrow.left.arrow.right")
        case .splitBill: Image(systemName: "person.2.fill")
        case .mobileRecharge: Image(systemName: "iphone")
        case .billPayment: Image(systemName: "doc.text")
        case .tickets: Image(systemName: "ticket.fill")
        }
    }
    
    var title: String {
        switch self {
        case .scanQRCode: "Scan QR Code"
        case .payAContact: "Pay a Contact"
        case .payNumber: " Pay Number"
        case .wallet: "Wallet"
        case .bankTransfer: "Bank Transfer"
        case .splitBill: "Split Bill"
        case .mobileRecharge: "Mobile Recharge"
        case .billPayment: "Bill Payment"
        case .tickets: "Tickets"
        }
    }
    
    var action: () {
        switch self {
        case .scanQRCode: print("DEBUG: Pressed scan QR Code")
        case .payAContact: print("DEBUG: Pressed Pay a Contact")
        case .payNumber: print("DEBUG: Pressed Pay number")
        case .wallet: print("DEBUG: Pressed Wallet")
        case .bankTransfer: print("DEBUG: Pressed Bank Transfer")
        case .splitBill: print("DEBUG: Pressed Split Bill")
        case .mobileRecharge: print("DEBUG: Pressed Mobile Recharge")
        case .billPayment: print("DEBUG: Pressed Bill Payment")
        case .tickets: print("DEBUG: Pressed Tickets")
        }
    }
}
