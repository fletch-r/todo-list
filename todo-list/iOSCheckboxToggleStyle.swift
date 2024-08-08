//
//  iOSCheckboxToggleStyle.swift
//  todo-list
//
//  Created by Andrew Fletcher on 08/08/2024.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()
        }, label: {
            HStack {
                // 3
//                Image(
//                    systemName: configuration.isOn ? "checkmark.square" : "square"
//                )
//                .foregroundStyle(.gray)
//                .background(.white)
                Rectangle()
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.white)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 6)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                    )
                    .overlay {
                        Image(systemName: configuration.isOn ? "checkmark" : "")
                            .resizable()
                            .frame(width: 12.0, height: 12.0)
                            .bold()
                            .foregroundStyle(.gray)
                    }

                configuration.label
            }
        })
    }
}

#Preview {
    Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/) {
        Text("I'm not a robot")
    }
    .toggleStyle(iOSCheckboxToggleStyle())
}
