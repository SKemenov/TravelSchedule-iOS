//
//  SetRowElement.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 24.04.2024.
//

import SwiftUI

struct SetRowElement: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.regMedium)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: 60)
    }
}
