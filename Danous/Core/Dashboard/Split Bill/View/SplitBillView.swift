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
            
            payToField
                .padding(.bottom, 8)
            
            Divider()
            
            membersList
            
            activateSplitButton
        }
        .navigationTitle("Split Bill")
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarBackButtonHidden()
        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button {
//                    dismiss()
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .dynamicTypeSize(.xxLarge)
//                        .foregroundColor(.secondary)
//                }
//            }
            
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
        .fullScreenCover(isPresented: $splitBillViewModel.showAddNewPersonView,
               onDismiss: { splitBillViewModel.addRecentlySelectedPersonToSplitBillMembers() },
               content: {
            SearchContactOrNumberView(selectedUser: $splitBillViewModel.recentlySelectedPerson)
        })
        .fullScreenCover(isPresented: $splitBillViewModel.showPickPayToAccountView,
                         onDismiss: { splitBillViewModel.setRecentlySelectedPersonAsPayTo() },
                         content: {
            PickPayToAccountView()
                .environmentObject(splitBillViewModel)
        })
        .fullScreenCover(isPresented: $splitBillViewModel.showSplitActivatedView) {
            SplitActivatedView()
        }
        .onChange(of: splitBillViewModel.recentlySelectedPerson) { _, newValue in
            if newValue != nil {
                splitBillViewModel.showPickPayToAccountView = false
                splitBillViewModel.showAddNewPersonView = false
            }
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
    
    private var payToField: some View {
        HStack {
            Text("To ")
                .font(.title2)
                .fontWeight(.semibold)
            Button {
                splitBillViewModel.showPickPayToAccountView.toggle()
            } label: {
                if let payTo = splitBillViewModel.payTo {
                    PersonCardView(user: .constant(payTo))
                        .padding(8)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                } else {
                    Text("Pick account")
                        .foregroundStyle(.tertiary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }
            .foregroundColor(.primary)
        }
        .padding(.horizontal, 32)
    }
    
    private var membersList: some View {
        List {
            ForEach($splitBillViewModel.members, id: \.self) { member in
                SplitBillMemberView(member: member)
                    .focused($isInputActive)
                    .deleteDisabled(member.wrappedValue.mobile == splitBillViewModel.members[0].mobile)
            }
            .onDelete(perform: { indexSet in
                splitBillViewModel.removePersonFromMembers(indexSet: indexSet)
            })
        }
        .listStyle(.plain)
        .scrollBounceBehavior(.always)
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
        
        guard
            let totalAmountDouble = Double(splitBillViewModel.totalAmountString),
            splitBillViewModel.payTo != nil else {
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
