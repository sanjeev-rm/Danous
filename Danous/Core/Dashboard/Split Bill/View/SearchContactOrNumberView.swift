//
//  AddNewPersonView.swift
//  Danous
//
//  Created by Sanjeev RM on 05/01/24.
//

import SwiftUI

struct SearchContactOrNumberView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var searchText: String = ""
    @State var searchResults: [DanousUser] = []
    
    @Binding var selectedUser: DanousUser?
    
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

extension SearchContactOrNumberView {
    
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
                PersonCardView(user: user)
                    .onTapGesture {
                        
                        selectedUser = user.wrappedValue
                        
                        dismiss()
                    }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    SearchContactOrNumberView(selectedUser: .constant(nil))
        .environmentObject(SplitBillViewModel())
}
