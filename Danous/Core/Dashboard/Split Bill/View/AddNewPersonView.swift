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
                
                TextField("Search name or number", text: $searchText)
                    .font(.title3.monospaced())
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.tertiary)
                    }
                    .padding([.horizontal, .top])
                
                Text("Searching Names shows only results from your contacts")
                    .font(.footnote)
                    .foregroundStyle(.tertiary)
                    .padding(.horizontal, 24)
                    .multilineTextAlignment(.center)
                
                List {
                    ForEach($searchResults, id: \.self) { user in
                        SearchPersonCardView(user: user)
                            .onTapGesture {
                                
                                splitBillViewModel.members.append(SplitBillMember(name: user.name.wrappedValue, mobile: user.mobile.wrappedValue, amountToPay: 0.0))
                                
                                DANOUS_SAMPLE_USERS.removeAll { danousUser in
                                    danousUser.name == user.name.wrappedValue
                                }
                                
                                dismiss()
                            }
                    }
                }
                .listStyle(.plain)
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
                searchResults = DANOUS_SAMPLE_USERS
            }
        }
    }
}

#Preview {
    AddNewPersonView()
        .environmentObject(SplitBillViewModel())
}
