//
//  StoriesFlowView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 04.06.2024.
//

import SwiftUI

struct StoriesFlowView: View {
    // MARK: - Constants
    private let firstIndex = 0

    // MARK: - Properties
    private var lastIndex: Int { storiesList.count - 1 }

    @Binding var storiesList: [StoriesList]
    @Binding var initialIndex: Int

    @Environment(\.dismiss) var dismiss

    // MARK: - View
    var body: some View {
        AppColors.Universal.black
            .ignoresSafeArea()
            .overlay {
                ZStack(alignment: .topTrailing) {
                    ZStack {
                        StoriesView(storiesList: $storiesList, initialIndex: $initialIndex)
                    }
                    .gesture(
                        DragGesture()
                            .onEnded { value in
                                switch (value.translation.width, value.translation.height) {
                                case (-30...30, 0...): handleDismiss()
                                default: break
                                }
                            }
                    )

                    CloseButtonView {
                        handleDismiss()
                    }
                    .padding(.top, AppSizes.Spacing.Custom.closeButton)
                    .padding(.trailing, AppSizes.Spacing.small)
                }
            }
    }
}

private extension StoriesFlowView {
    func handleDismiss() {
        dismiss()
    }
}

#Preview {
    StoriesFlowView(storiesList: .constant(StoriesList.mockData), initialIndex: .constant(0))
}
