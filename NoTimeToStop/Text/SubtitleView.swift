//
//  SubtitleView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 21/12/2023.
//

import Combine
import SwiftUI

/// `SubtitleView`: A SwiftUI View that displays and animates subtitles.
/// This view uses environment objects, state variables, and animations to create a dynamic text effect.
struct SubtitleView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state.
    /// It allows `SubtitleView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// `begin`: A binding variable that indicates when to start the animations.
    /// When `begin` is true, the animation sequence starts.
    @Binding var begin: Bool

    /// `changeColour`: A state variable that tracks the color theme state of the text.
    /// It is used to toggle the text color between two colors (e.g., black and white).
    @State var changeColour = false

    /// `characterVisibility`: A dictionary mapping each character index to its opacity level.
    /// It is used to control the fade-in animation of each character individually.
    @State var characterVisibility: [Int: Double] = [:]

    /// `text`: The text to be displayed and animated.
    var text: String

    /// `size`: The font size for the text.
    var size: Double = 7

    /// `delay`: The delay before starting the animation of each character.
    var delay: Double = AppConfig.animationDelaySubtitle

    // MARK: - Body

    /// The body of `SubtitleView`.
    /// It defines the layout and appearance of the animated text.
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            // Creating individual Text views for each character to control their animation.
            ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                characterView(character, at: index)
            }
        }
        .onChange(of: begin) { _, newValue in
            if newValue {
                startAnimation() // Starts the animation when 'begin' is true.
            }
        }
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event) // Responds to changes in the current timer event.
        }
    }

    // MARK: - Methods

    /// `handleEvent(at:)`: Handles specific timer events.
    /// It resets the animation based on certain events.
    /// - Parameter event: The `TimerEvent` that triggers specific actions for the text animation.
    func handleEvent(at event: TimerEvent) {
        if [.eventAtSecond(4), .eventAtSecond(8)].contains(event) {
            resetAnimation() // Resets the animation.
        }
    }

    /// `characterView(_:, at:)`: Creates a view for each character with animation.
    /// It configures the appearance and animation of individual characters.
    /// - Parameters:
    ///   - character: The character to be displayed.
    ///   - index: The index of the character in the text.
    func characterView(_ character: Character, at index: Int) -> some View {
        Text(String(character))
            .font(Font.custom("Aeonik", size: size))
            .fontWeight(.bold)
            .opacity(characterVisibility[index, default: 0]) // Controlling opacity for animation.
            .foregroundColor(changeColour ? .white : .black) // Toggle text color.
    }

    /// `startAnimation()`: Starts the character appearance animation.
    /// It sequentially animates each character's appearance with a delay.
    func startAnimation() {
        for index in 0..<text.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay * Double(index)) {
                characterVisibility[index] = 1
            }
        }
    }

    /// `resetAnimation()`: Resets the animation state and toggles the color theme.
    /// It resets the `begin` state, toggles the text color, and clears the character visibility.
    func resetAnimation() {
        begin = false
        changeColour.toggle()
        characterVisibility = [:]
    }
}

#Preview {
    // Preview wrapper for SubtitleView
    return SubtitleViewPreviewWrapper()

    // Wrapper view to simulate the behavior of SubtitleView in previews
    struct SubtitleViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()
        @State private var begin = false

        private var text = "NEVER-ENDING TASK"

        var body: some View {
            SubtitleView(
                begin: $begin,
                text: text,
                size: 10,
                delay: AppConfig.animationDelaySubtitle
            )
            .padding()
            .onAppear {
                mockTimerManager.start()
                begin = true
            }
            .onChange(of: mockTimerManager.currentEvent) { _, event in
                handleEvent(at: event)
            }
            .environmentObject(mockTimerManager)
        }

        private func handleEvent(at event: TimerEvent) {
            switch event {
            case .eventAtSecond(3), .eventAtSecond(8):
                begin = true
            default:
                break
            }
        }
    }
}
