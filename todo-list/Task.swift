//
//  Task.swift
//  todo-list
//
//  Created by Andrew Fletcher on 08/08/2024.
//

import SwiftUI

struct Task: View {
    @State private var isOn = false
    
    let title: String
    let description: String
    let time: String

    var body: some View {
        HStack() {
            Toggle(isOn: $isOn) {
                Text("")
            }
            .toggleStyle(iOSCheckboxToggleStyle())
            Text("**\(title):** \(description)")
            Spacer()
            Text(time)
                .opacity(0.6)
                .bold()
                .padding(8)
                .background(.white)
                .font(.caption)
                .cornerRadius(50)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

#Preview {
    Task(
        title: "title", description: "description", time: "50 min"
    )
}
