//
//  DashboardView.swift
//  Danous
//
//  Created by Sanjeev RM on 16/12/23.
//

import SwiftUI

struct DashboardView: View {
    
    @State var searchText: String = ""
    @State var userName: String = "John Doe"
    
    var body: some View {
        VStack {
            VStack(spacing: 32) {
                searchBarAndSettingsButton
                
                greetingTitle
                    .padding(.leading)
            }
            .padding([.horizontal, .top])
            .foregroundStyle(.white)
            
            featuresGrid
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image(danousImage: .backgroundImage)
                .resizable()
                .ignoresSafeArea()
        }
    }
}

extension DashboardView {
    
    private var searchBarAndSettingsButton: some View {
        HStack(spacing: 16) {
            searchBar
            settingsButton
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search number or contact", text: $searchText)
        }
        .font(.callout)
        .foregroundColor(.secondary)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 32)
                .foregroundStyle(Color(uiColor: .tertiarySystemGroupedBackground))
        )
    }
    
    private var settingsButton: some View {
        Button {
        } label: {
            Image(systemName: "gearshape.fill")
                .foregroundStyle(Color(uiColor: .white))
                .font(.title)
        }
    }
    
    private var greetingTitle: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Greetings")
            Text(userName)
        }
        .font(.largeTitle.monospaced().bold())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var featuresGrid: some View {
        VStack {
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    DashboardView()
}
