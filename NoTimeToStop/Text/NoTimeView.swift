//
//  NoTimeView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `NoTimeView`: A SwiftUI View that displays and animates the phrase "NO TIME".
/// This view uses environment objects, state variables, and animations to create a dynamic text effect.
struct NoTimeView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state.
    /// It allows `NoTimeView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// `phraseOffset`: A state variable for the initial distance of the slide-in animation.
    /// It controls the horizontal offset of the text for the sliding effect.
    @State var phraseOffset: CGFloat = 100

    /// `opacityOffsets`: A dictionary that maps each character index to its opacity level.
    /// It is used to control the fade-in animation of each letter individually.
    @State var opacityOffsets = [Int: CGFloat]()

    /// `changeColour`: A state variable that tracks the color theme state of the text.
    /// It is used to toggle the text color between two colors (e.g., white and black).
    @State var changeColour = false

    /// `text`: A constant holding the string "NO TIME" to be displayed and animated.
    let text = "NO TIME"

    // MARK: - Body

    /// The body of `NoTimeView`.
    /// It defines the layout and appearance of the animated text.
    var body: some View {
        HStack {
            // Creates an HStack of individual letters for animation.
            HStack(spacing: -3) {
                ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                    Text(String(letter))
                        .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                        .fontWeight(.black)
                        .kerning(-3)
                        .foregroundColor(changeColour ? .white : .black)
                        .opacity(opacityOffsets[index] ?? 0)
                }
            }
            .offset(x: phraseOffset, y: 0)

            Spacer()
        }
        .onAppear {
            startAnimation() // Initiates the animation when the view appears.
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event) // Responds to changes in the current timer event.
        }
    }

    // MARK: - Methods

    /// `handleEvent(at:)`: Handles specific timer events to control the animation of the text.
    /// Depending on the event, it can reset and restart the text animation.
    /// - Parameter event: The `TimerEvent` that triggers specific actions for the text animation.
    func handleEvent(at event: TimerEvent) {
        switch event {
        case .eventAtSecond(4), .eventAtSecond(8):
            resetAnimation() // Resets the animation to its initial state.
            startAnimation() // Restarts the animation.
        default:
            break // Does nothing for other events.
        }
    }

    /// `startAnimation()`: Initiates the slide-in and fade-in animations for the text.
    /// It animates the phraseOffset to create a slide-in effect and updates opacityOffsets to fade in each letter.
    func startAnimation() {
        // Slide-in animation effect for the entire text.
        withAnimation(Animation.easeInOut(duration: 1)) {
            phraseOffset = CGFloat.zero
        }

        // Fade-in animation for each letter with a delay.
        for index in 0..<text.count {
            let reverseIndex = text.count - 1 - index
            withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                .delay(Double(reverseIndex) * AppConfig.animationDelay)) {
                    opacityOffsets[index] = 1
                }
        }
    }

    /// `resetAnimation()`: Resets the animation state of the text to its initial values.
    /// It sets phraseOffset back to its starting value and resets the opacity of each letter to 0.
    func resetAnimation() {
        phraseOffset = 100 // Resets the slide-in animation offset.
        for index in 0..<text.count {
            opacityOffsets[index] = CGFloat.zero // Resets the opacity of each letter.
        }

        changeColour.toggle() // Toggles the color theme state.
    }
}

#Preview {
    // Preview wrapper for NoTimeView
    return NoTimeViewPreviewWrapper()
    struct NoTimeViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()

        var body: some View {
            NoTimeView()
                .onAppear {
                    mockTimerManager.start()
                }
                .environmentObject(mockTimerManager)
        }
    }
}
