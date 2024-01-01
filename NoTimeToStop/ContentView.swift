//
//  ContentView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import Combine
import SwiftUI

/// `ContentView`: The main view of the SwiftUI application.
/// This view integrates various subviews and manages their animations based on timer events.
struct ContentView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to manage timer events.
    /// It allows `ContentView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// State variables to control the visibility of subtitles.
    /// These boolean values are used to trigger animations for each subtitle.
    @State var runSubtitle0 = false
    @State var runSubtitle1 = false
    @State var runSubtitle2 = false
    @State var runSubtitle3 = false
    @State var runSubtitle4 = false

    /// Constants for subtitle text strings.
    /// This enum defines the text for each subtitle in the view.
    enum Subtitles {
        static let subtitle0 = "CLB 003"
        static let subtitle1 = "LIFE SEEMINGLY FILLED"
        static let subtitle2 = "WITH NEVER-ENDING TASKS."
        static let subtitle3 = "ORDERDESIGNUK"
        static let subtitle4 = "X BM/000 325"
    }

    // MARK: - Body

    /// The body of `ContentView`.
    /// It defines the layout and overall appearance of the app's main view.
    var body: some View {
        ZStack {
            // Background view.
            OrbView()

            // Main content stack.
            VStack(alignment: .leading, spacing: 3) {
                // Top upper subtitle view.
                HStack {
                    Spacer()
                    SubtitleView(begin: $runSubtitle0, text: Subtitles.subtitle0, delay: 0.4)
                }

                // Main title views with fixed heights.
                NoTimeView().frame(height: 65)
                ToStopView().frame(maxHeight: 65)

                // Bottom subtitle views in two columns.
                HStack(spacing: 15) {
                    VStack(alignment: .leading) {
                        SubtitleView(begin: $runSubtitle1, text: Subtitles.subtitle1)
                        SubtitleView(begin: $runSubtitle2, text: Subtitles.subtitle2)
                    }

                    VStack(alignment: .leading) {
                        SubtitleView(begin: $runSubtitle3, text: Subtitles.subtitle3)
                        SubtitleView(begin: $runSubtitle4, text: Subtitles.subtitle4)
                    }
                }

                Spacer()
            }
            .padding(15)
        }
        // Timer and animation triggers.
        .onAppear {
            timerManager.start() // Starts the timer when the view appears.
            startSubtitlesAnimation() // Initiates the subtitle animations.
            runSubtitle0 = true
        }
        .onDisappear {
            timerManager.stop() // Stops the timer when the view disappears.
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event) // Responds to changes in the current timer event.
        }
    }

    // MARK: - Methods

    /// `handleEvent(at:)`: Handles specific timer events.
    /// It resets and restarts the subtitle animations based on certain events.
    /// - Parameter event: The `TimerEvent` that triggers specific actions for the animations.
    func handleEvent(at event: TimerEvent) {
        switch event {
        case .eventAtSecond(4), .eventAtSecond(8):
            startSubtitlesAnimation() // Restarts the subtitle animations.
            runSubtitle0 = true
        default:
            break // Does nothing for other events.
        }
    }

    /// `startSubtitlesAnimation()`: Animates subtitles sequentially.
    /// It triggers the animations for each subtitle view with a cumulative delay.
    func startSubtitlesAnimation() {
        var cumulativeDelay = Double.zero
        let subtitleBindings = [
            $runSubtitle1,
            $runSubtitle2,
            $runSubtitle3,
            $runSubtitle4
        ]

        let subtitleTexts = [
            Subtitles.subtitle1,
            Subtitles.subtitle2,
            Subtitles.subtitle3,
            Subtitles.subtitle4
        ]

        for (index, subtitleBinding) in subtitleBindings.enumerated() {
            let animationDelay = calculateTotalAnimationDuration(for: subtitleTexts[index])
            DispatchQueue.main.asyncAfter(deadline: .now() + cumulativeDelay) {
                subtitleBinding.wrappedValue = true
            }
            cumulativeDelay += animationDelay
        }
    }

    /// `calculateTotalAnimationDuration(for:)`: Calculates the total duration of the animation for a given text.
    /// It determines the animation duration based on the number of characters and a predefined delay.
    /// - Parameter text: The text for which to calculate the animation duration.
    func calculateTotalAnimationDuration(for text: String) -> Double {
        return Double(text.count) * AppConfig.animationDelaySubtitle
    }
}

#Preview {
    // Wrapper for previewing ContentView with a mock timer manager
    return ContentViewPreviewWrapper()
    struct ContentViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()

        var body: some View {
            ContentView()
                .onAppear {
                    mockTimerManager.start()
                }
                .environmentObject(mockTimerManager)
        }
    }
}
