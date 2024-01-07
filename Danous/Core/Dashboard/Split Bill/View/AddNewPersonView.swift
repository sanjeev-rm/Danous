//
//  AddNewPersonView.swift
//  Danous
//
//  Created by Sanjeev RM on 05/01/24.
//

import SwiftUI

struct AddNewPersonView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var splitBillViewModel: SplitBillViewModel
    
    @State var searchText: String = ""
    @State var searchResults: [DanousUser] = []
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 16) {
                
                textField
                
                disclaimerText
                
                resultList
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
            .onChange(of: searchText) { _, _ in
                searchResults = DanousUser.SAMPLE_USERS
            }
        }
    }
}

extension AddNewPersonView {
    
    private var textField: some View {
        TextField("Search name or number", text: $searchText)
            .font(.title3.monospaced())
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .stroke(lineWidth: 3)
                    .foregroundStyle(.tertiary)
            }
            .padding([.horizontal, .top])
    }
    
    private var disclaimerText: some View {
        Text("Searching Names shows only results from your contacts")
            .font(.footnote)
            .foregroundStyle(.tertiary)
            .padding(.horizontal, 24)
            .multilineTextAlignment(.center)
    }
    
    private var resultList: some View {
        List {
            ForEach($searchResults, id: \.self) { user in
                SearchPersonCardView(user: user)
                    .onTapGesture {
                        
                        splitBillViewModel.members.append(SplitBillMember(name: user.name.wrappedValue, mobile: user.mobile.wrappedValue, amountToPay: 0.0))
                        
                        DanousUser.SAMPLE_USERS.removeAll { danousUser in
                            danousUser.name == user.name.wrappedValue
                        }
                        
                        dismiss()
                    }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    AddNewPersonView()
        .environmentObject(SplitBillViewModel())
}
