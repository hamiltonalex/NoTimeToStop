//
//  ToStopView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `ToStopView`: A SwiftUI View that displays and animates the phrase "TO".
/// This view uses environment objects, state variables, and animations to create a dynamic text effect.
/// It also interacts with the `StopThinkExistView` for a combined animation effect.
struct ToStopView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state.
    /// It allows `ToStopView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// `characterVisibilities`: A dictionary that maps each character index to its opacity level.
    /// It is used to control the fade-in animation of each character individually.
    @State var characterVisibilities = [Int: Double]()

    /// `startLiftUpEffect`: A state variable to trigger the lift-up animation effect for the last word in the phrase.
    @State var startLiftUpEffect = false

    /// `changeColour`: A state variable that tracks the color theme state of the text.
    /// It is used to toggle the text color between two colors (e.g., white and black).
    @State var changeColour = false

    /// `text`: A constant holding the string "TO" to be displayed and animated.
    let text = "TO"

    // MARK: - Body

    /// The body of `ToStopView`.
    /// It defines the layout and appearance of the animated text and integrates `StopThinkExistView`.
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center, spacing: -8) {
                // Creates animated "TO" text with individual character control.
                ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                    textWithEffect(String(character), index: index)
                }

                // Additional view for "STOP.", "THINK.", "EXIST." animation.
                StopThinkExistView(begin: $startLiftUpEffect)
                    .padding(.leading, 20)

                Spacer()
            }
            .padding(.bottom, 8)
        }
        .frame(height: 60)
        .mask(Rectangle().frame(height: 60))
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

    /// `textWithEffect(_:, index:)`: Configures the appearance and animation of individual characters.
    /// Applies font, weight, kerning, opacity, and color based on the current state.
    /// - Parameters:
    ///   - text: The character to be animated.
    ///   - index: The index of the character in the phrase.
    func textWithEffect(_ text: String, index: Int) -> some View {
        Text(text)
            .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
            .fontWeight(.black)
            .kerning(-3)
            .opacity(characterVisibilities[index] ?? 0)
            .foregroundColor(changeColour ? .white : .black)
    }

    /// `startAnimation()`: Initiates the fade-in animation for each character and triggers the lift-up effect.
    /// It sequentially fades in each character and then starts the lift-up animation for `StopThinkExistView`.
    func startAnimation() {
        let totalDelay = Double(text.count) * AppConfig.animationDelay
        for index in 0..<text.count {
            fadeInCharacter(at: index)
        }

        // Trigger the lift-up effect.
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDelay) {
            startLiftUpEffect = true
        }
    }

    /// `resetAnimation()`: Resets the animation state, preparing for the next animation cycle.
    /// It resets the visibility of each character and toggles the color theme state.
    func resetAnimation() {
        characterVisibilities = [Int: Double]()
        startLiftUpEffect = false
        changeColour.toggle()
    }

    /// `fadeInCharacter(at:)`: Implements the fade-in animation for individual characters.
    /// It animates the opacity of each character with a delay, creating a sequential fade-in effect.
    /// - Parameter index: The index of the character to animate.
    func fadeInCharacter(at index: Int) {
        withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
            .delay(Double(index) * AppConfig.animationDelay)) {
                characterVisibilities[index] = 1
            }
    }
}

#Preview {
    // Preview wrapper for ToStopView
    return ToStopViewPreviewWrapper()
    struct ToStopViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()

        var body: some View {
            ToStopView()
                .onAppear {
                    mockTimerManager.start()
                }
                .environmentObject(mockTimerManager)
        }
    }
}
