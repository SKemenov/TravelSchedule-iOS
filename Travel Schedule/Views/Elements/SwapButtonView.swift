//
//  SwapButtonView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 03.06.2024.
//

import SwiftUI

struct SwapButtonView: View {
    @Binding var destinations: [Destination]

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.ypWhite)
                .frame(width: AppSizes.Size.swappingButton)
            Button {
                swapDestinations()
            } label: {
                    .foregroundColor(.ypBlue)
                AppImages.Icons.swap
            }
        }
    }
}

private extension SwapButtonView {
    func swapDestinations() {
        (destinations[.departure], destinations[.arrival]) = (destinations[.arrival], destinations[.departure])
    }
}
#Preview {
    SwapButtonView(destinations: .constant(Destination.sampleData))
}
