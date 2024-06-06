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
                .foregroundStyle(AppColors.Universal.white)
                .frame(width: AppSizes.Size.swappingButton)
            Button {
                swapDestinations()
            } label: {
                AppImages.Icons.swap
                    .foregroundStyle(AppColors.Universal.blue)
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
