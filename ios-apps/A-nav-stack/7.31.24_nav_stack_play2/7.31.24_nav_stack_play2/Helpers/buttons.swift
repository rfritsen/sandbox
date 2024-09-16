//
//  button.swift
//  7.31.24_nav_stack_play2
//
//  Created by Ryan on 7/31/24.
//

import SwiftUI

struct PinkButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .font(.title)
                .foregroundColor(.purple)
                .background(configuration.isPressed ? Color.blue : Color.pink)
                .cornerRadius(5)
        }
    }

struct YellowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .frame(width: 200, height: 100, alignment: .center)
        .foregroundColor(.white)
        .background(Color.yellow)
        .foregroundColor(Color.red)
}
}
