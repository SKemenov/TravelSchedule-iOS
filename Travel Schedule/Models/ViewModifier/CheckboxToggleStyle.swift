//
//  CheckboxToggleStyle.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 25.04.2024.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.label
            Spacer()
            (configuration.isOn ? Image.iconCheckboxOn : Image.iconCheckboxOff)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct RadioButtonToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.label
            Spacer()
            (configuration.isOn ? Image.iconRadioOn : Image.iconRadioOff)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
