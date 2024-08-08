//
//  DoneChip.swift
//  todo-list
//
//  Created by Andrew Fletcher on 07/08/2024.
//

import SwiftUI

struct DoneChip: View {
    let amount: String
    
    var body: some View {
        HStack(content: {
            Image(
                systemName: "checkmark.circle.fill"
            )
            .opacity(0.3)
            Text(amount)
                .bold()
                .font(.footnote)
                .opacity(0.4)
        })
        .padding(8)
        .background(
            Color(
                red: 0.949,
                green: 0.937,
                blue: 0.933
            )
        )
        .cornerRadius(100)
    }
}

#Preview {
    DoneChip(amount: "24")
}
