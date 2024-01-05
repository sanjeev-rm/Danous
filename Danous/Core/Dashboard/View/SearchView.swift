//
//  SearchView.swift
//  Danous
//
//  Created by Sanjeev RM on 04/01/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    
    @Binding var show: Bool
    
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            searchBarAndSettingsButton
            
            ScrollView {
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

extension SearchView {
    
    private var searchBarAndSettingsButton: some View {
        HStack(spacing: 16) {
            searchBar
            xButton
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search number or contact", text: $searchText)
                .focused($isTextFieldFocused, equals: true)
                .onAppear {
                    isTextFieldFocused = true
                }
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 32)
                .foregroundStyle(Color(uiColor: .tertiarySystemGroupedBackground))
        )
        .shadow(radius: 8)
    }
    
    private var xButton: some View {
        Button {
            withAnimation(.easeOut) {
                show = false
            }
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.secondary)
                .font(.title)
        }
    }
}

#Preview {
    SearchView(show: .constant(true))
}
