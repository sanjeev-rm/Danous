//
//  DanousBasicButton.swift
//  Danous
//
//  Created by Sanjeev RM on 13/12/23.
//

import SwiftUI

struct DanousBasicButton: View {
    var label: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .font(.title3.bold())
                .padding(8)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    DanousBasicButton(label: "Press me") {}
}
