//
//  SinglePreviewStoryView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 06.06.2024.
//

import SwiftUI

struct SinglePreviewStoryView: View {
    // MARK: - Constants
    private let titleLineLimit = 3

    // MARK: - Properties
    var previewStory: StoriesList

    // MARK: - View
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(previewStory.previewImageName)
                .resizable()
                .scaledToFill()
                .frame(width: AppSizes.Width.storyPreview, height: AppSizes.Height.storyPreview)
                .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
                .opacity(previewStory.isShowed ? .halfOpacity : .fullOpacity)

            Text(previewStory.title)
                .foregroundColor(AppColors.Universal.white)
                .font(AppFonts.Regular.small)
                .padding(.horizontal, AppSizes.Spacing.small)
                .padding(.bottom, AppSizes.Spacing.medium)
                .lineLimit(titleLineLimit)

            RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large)
                .strokeBorder(
                    AppColors.Universal.blue,
                    lineWidth: previewStory.isShowed ? .zero : AppSizes.Line.large
                )
        }
        .padding(.zero)
        .frame(width: AppSizes.Width.storyPreview, height: AppSizes.Height.storyPreview)
        .contentShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
    }
}

#Preview {
    SinglePreviewStoryView(previewStory: StoriesList.mockData[0])
}
