//
//  StoriesProgressBarView.swift
//  Travel Schedule
//
//  Created by Sergey Kemenov on 04.06.2024.
//

import SwiftUI
import Combine

struct StoriesProgressBarView: View {
    // MARK: - Constants
    let storiesCount: Int
    let timerConfiguration: TimerConfiguration

    // MARK: - Properties
    @Binding var progress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancelable: Cancellable?

    // MARK: - View
    var body: some View {
        ProgressBarView(numberOfSections: storiesCount, progress: progress)
            .padding(.top, AppSizes.Spacing.Custom.progressBar)
            .padding(.horizontal, AppSizes.Spacing.small)
            .onAppear {
                timer = Self.createTimer(configuration: timerConfiguration)
                cancelable = timer.connect()
            }
            .onDisappear {
                cancelable?.cancel()
            }
            .onReceive(timer) { _ in
                withAnimation {
                    progress = timerConfiguration.nextProgress(progress: progress)
                }
            }
    }

    // MARK: - Inits
    init(storiesCount: Int, timerConfiguration: TimerConfiguration, progress: Binding<CGFloat>) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._progress = progress
        self.timer = Self.createTimer(configuration: timerConfiguration)
    }
}

// MARK: - Private methods
private extension StoriesProgressBarView {
    static func createTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}

#Preview {
    StoriesProgressBarView(
        storiesCount: 3,
        timerConfiguration: TimerConfiguration(storiesCount: 3),
        progress: .constant(0.5)
    )
    .background(
        AppColors.Universal.red.opacity(0.5)
    )
}
