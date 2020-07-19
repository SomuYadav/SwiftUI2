//
//  AddStatusButton.swift
//  SwiftUI2
//
//  Created by Apple on 12/07/20.
//

import SwiftUI

struct AddButonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.clipShape(Circle()).overlay(
            Image(systemName: "plus.circle.fill")
            ,alignment: .bottomTrailing)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.3 : 1.0)
    }
}
