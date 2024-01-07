//
//  SplitBillView.swift
//  Danous
//
//  Created by Sanjeev RM on 05/01/24.
//

import SwiftUI

struct SplitBillView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject var splitBillViewModel = SplitBillViewModel()
    
    @FocusState var isInputActive: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            totalAmountField
            
            membersList
            
            activateSplitButton
        }
        .navigationTitle("Split Bill")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .dynamicTypeSize(.xxLarge)
                        .foregroundColor(.secondary)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    splitBillViewModel.showAddNewPersonView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .dynamicTypeSize(.xLarge)
                }
            }
            
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    isInputActive = false
                }
            }
        }
        .sheet(isPresented: $splitBillViewModel.showAddNewPersonView) {
            AddNewPersonView()
                .presentationDetents([.large, .medium])
                .environmentObject(splitBillViewModel)
        }
        .fullScreenCover(isPresented: $splitBillViewModel.showSplitActivatedView) {
            SplitActivatedView()
        }
    }
}

extension SplitBillView {
    
    private var totalAmountField: some View {
        HStack {
            Spacer()
            Text("$")
            TextField("total amount", text: $splitBillViewModel.totalAmountString)
                .keyboardType(.decimalPad)
                .focused($isInputActive)
            Spacer()
        }
        .font(.largeTitle.monospaced())
        .padding()
    }
    
    private var membersList: some View {
        List {
            ForEach($splitBillViewModel.members, id: \.self) { member in
                SplitBillMemberView(member: member)
                    .focused($isInputActive)
            }
        }
        .listStyle(.plain)
        .scrollBounceBehavior(.basedOnSize)
    }
    
    private var activateSplitButton: some View {
        DanousBasicButton(label: "Activate Split") {
            withAnimation(.easeIn) {
                splitBillViewModel.showSplitActivatedView = true
            }
        }
        .padding()
        .disabled(!canActivateSplit())
    }
}

extension SplitBillView {
    
    func canActivateSplit() -> Bool {
        var sum = 0.0
        for member in splitBillViewModel.members {
            sum = sum + member.amountToPay
        }
        
        guard let totalAmountDouble = Double(splitBillViewModel.totalAmountString) else {
            return false
        }
        
        return sum == totalAmountDouble
    }
}

#Preview {
    NavigationStack {
        SplitBillView()
    }
}
