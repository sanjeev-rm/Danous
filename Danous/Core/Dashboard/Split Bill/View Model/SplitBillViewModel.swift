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
    @Published var recentlySelectedPerson: DanousUser? = nil
    @Published var totalAmountString: String = ""
    @Published var payTo: DanousUser?
    @Published var showPickPayToAccountView: Bool = false
    @Published var showSplitActivatedView: Bool = false
    
    @Published var members: [SplitBillMember] = [SplitBillMember(name: "John Doe", mobile: "9082883516", amountToPay: 0)]
    
    func addRecentlySelectedPersonToSplitBillMembers() {
        guard let newPerson = recentlySelectedPerson else { return }
        
        members.append(SplitBillMember(name: newPerson.name,
                                       mobile: newPerson.mobile,
                                       amountToPay: 0))
        
        // Removing the selected person from the sample users list, so that same user is not added twice.
        DanousUser.SAMPLE_USERS.removeAll { danousUser in
            danousUser.mobile == newPerson.mobile
        }
        
        recentlySelectedPerson = nil
    }
    
    func setRecentlySelectedPersonAsPayTo() {
        guard let newPerson = recentlySelectedPerson else { return }
        
        payTo = newPerson
        
        // Removing the selected person from the sample users list so that the same user is not paying themselves.
        DanousUser.reloadSampleUsers()
        DanousUser.SAMPLE_USERS.removeAll { danousUser in
            
            if danousUser.mobile == newPerson.mobile { return true }
            
            var isAlreadyMember: Bool {
                for member in members {
                    if member.mobile == danousUser.mobile {
                        return true
                    }
                }
                return false
            }
            
            return isAlreadyMember
        }
        
        recentlySelectedPerson = nil
    }
    
    func removePersonFromMembers(indexSet: IndexSet) {
        let deletedPerson = members[indexSet.first!]
        DanousUser.SAMPLE_USERS.append(DanousUser(name: deletedPerson.name, mobile: deletedPerson.mobile))
        members.remove(atOffsets: indexSet)
    }
}
