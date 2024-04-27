//
//  SetCustomNavBackButton.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 25.04.2024.
//

import SwiftUI

struct SetCustomNavBackButton: ViewModifier {
    // swiftlint:disable:next attributes
    @Environment(\.dismiss) var dismiss

    @ViewBuilder
    @MainActor
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .imageScale(.large)
                            .foregroundColor(.ypBlackDuo)
                    }
                }
            }
            .contentShape(Rectangle()) // Start of the gesture to dismiss the navigation
            .gesture(
                DragGesture(coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width > .zero
                            && value.translation.height > -30
                            && value.translation.height < 30 {
                            dismiss()
                        }
                    }
            )
    }
}
