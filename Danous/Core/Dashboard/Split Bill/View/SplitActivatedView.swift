//
//  SplitActivatedView.swift
//  Danous
//
//  Created by Sanjeev RM on 07/01/24.
//

import SwiftUI

struct SplitActivatedView: View {
    
    var body: some View {
        VStack {
            Text("Split Activated!")
            Image(systemName: "checkmark")
        }
        .background {
            Image(danousImage: .backgroundImage)
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SplitActivatedView()
}
