//
//  ContentView.swift
//  todo-list
//
//  Created by Andrew Fletcher on 06/08/2024.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var isOn = false

    let dates = generateDatesFromStartOfYear(numberOfDays: 30)

    var body: some View {
        VStack {
            ZStack {
                Color(red: 0.984, green: 0.973, blue: 0.965)
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        Text("today")
                            .bold()
                            .font(.largeTitle)
                            .frame(alignment: .topLeading)
                        Spacer()
                        HStack(spacing: 10, content: {
                            DoneChip(amount: "24")
                            HoursChip()
                        })
                    }
                    .frame(maxWidth: .infinity)
                    HorizontalDateList()
                    Text("Morning - 06:00")
                        .font(.caption)
                        .bold()
                        .opacity(0.5)
                    Task(
                        title: "@coinbase",
                        description: "design user registration process",
                        time: "50 min"
                    )
                    Task(
                        title: "@apple",
                        description: "review and provide feedback on the wireframes for the new design concept",
                        time: "45 min"
                    )
                    Task(
                        title: "@shopify",
                        description: "mood board for the ecommerce template",
                        time: "30 min"
                    )
                    Text("Afternoon - 12:00")
                        .font(.caption)
                        .bold()
                        .opacity(0.5)
                    Task(
                        title: "@apple",
                        description: "finalize color palette and typography",
                        time: "25 min"
                    )
                    Text("Evening - 17:00")
                        .font(.caption)
                        .bold()
                        .opacity(0.5)
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
