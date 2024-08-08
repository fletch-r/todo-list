//
//  HoursChip.swift
//  todo-list
//
//  Created by Andrew Fletcher on 07/08/2024.
//

import SwiftUI

struct HoursChip: View {
    var body: some View {
        HStack(content: {
            Image(systemName: "clock.fill")
                .opacity(0.3)
            Text("1.5 of 7.5 hrs")
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
