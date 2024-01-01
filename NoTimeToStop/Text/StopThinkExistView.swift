//
//  StopThinkExistView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `StopThinkExistView`: A SwiftUI View that displays and animates the phrases "STOP.", "THINK.", and "EXIST.".
/// This view uses environment objects, state variables, and animations to create a dynamic text effect.
struct StopThinkExistView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state.
    /// It allows `StopThinkExistView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// `begin`: A binding variable that indicates when to start the animations.
    /// When `begin` is true, the animation sequence starts.
    @Binding var begin: Bool

    /// `characterVisibilities`: A dictionary mapping each character index to its opacity level.
    /// It is used to control the fade-in animation of each character individually.
    @State var characterVisibilities = [Int: Double]()

    /// `yOffset`: A state variable representing the initial Y-offset for the view.
    /// It is used to control the vertical position of the words during animations.
    @State var yOffset: CGFloat = 70

    /// `changeColour`: A state variable that tracks the color theme state of the text.
    /// It is used to toggle the text color between two colors (e.g., black and white).
    @State var changeColour = false

    /// `wordHeight`: A constant representing the height of each animated word.
    let wordHeight: CGFloat = 70

    /// `words`: An array of strings to be displayed and animated.
    /// The array contains the words "STOP.", "THINK.", and "EXIST.".
    let words = ["STOP.", "THINK.", "EXIST."]

    // MARK: - Body

    /// The body of `StopThinkExistView`.
    /// It defines the layout and behavior of the animated text.
    var body: some View {
        ZStack {
            if begin {
                // Creates a VStack to vertically stack the words.
                VStack(spacing: 0) {
                    content
                }
            }
        }
        .frame(height: wordHeight)
        .offset(y: yOffset) // Applies a vertical offset.
        .onChange(of: begin) { _, newValue in
            if newValue {
                startAnimating() // Starts the animation when 'begin' is true.
            }
        }
    }

    // MARK: - Computed Properties

    /// `content`: A computed property to generate the view content.
    /// It creates a view for each word in the `words` array, applying special handling for the first word.
    var content: some View {
        ForEach(words.indices, id: \.self) { wordIndex in
            if wordIndex == 0 {
                // Special handling for animating each letter in "STOP.".
                HStack {
                    animateLetters(of: words[wordIndex])
                    Spacer()
                }
            } else {
                // Display other words without individual letter animations.
                HStack {
                    Text(words[wordIndex])
                        .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                        .fontWeight(.black)
                        .kerning(-3)
                        .frame(height: wordHeight)
                        .foregroundColor(changeColour ? .black : .white)
                    Spacer()
                }
            }
        }
    }

    // MARK: - Methods

    /// `animateLetters(of:)`: Animates each letter in a word.
    /// It creates a view for each letter and applies fade-in animations.
    /// - Parameter word: The word whose letters will be animated.
    func animateLetters(of word: String) -> some View {
        HStack(spacing: -3) {
            ForEach(Array(word.enumerated()), id: \.offset) { index, letter in
                Text(String(letter))
                    .font(Font.custom("Aeonik", size: AppConfig.titleFontSize))
                    .fontWeight(.black)
                    .opacity(characterVisibilities[index] ?? 0)
                    .foregroundColor(changeColour ? .black : .white)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                            .delay(Double(index) * AppConfig.animationDelay)) {
                                characterVisibilities[index] = 1
                            }
                    }
            }
        }
        .frame(height: wordHeight)
    }

    /// `startAnimating()`: Starts the animation sequence for the view.
    /// It resets the view state, animates the first word, and then triggers the lift-up animation for subsequent words.
    func startAnimating() {
        resetStates()
        animateFirstWord()
        animateWordLiftUp()
    }

    /// `resetStates()`: Resets the view's state for a new animation cycle.
    /// It resets the opacity of each character, the Y-offset, and toggles the color theme state.
    func resetStates() {
        changeColour.toggle()
        characterVisibilities = [Int: Double]()
        yOffset = 70
    }

    /// `animateFirstWord()`: Animates the letters of the first word ("STOP.").
    /// It applies a sequential fade-in animation to each letter.
    func animateFirstWord() {
        for index in 0..<words[0].count {
            withAnimation(Animation.easeInOut(duration: AppConfig.animationDuration)
                .delay(Double(index) * AppConfig.animationDelay)) {
                    characterVisibilities[index] = 1
                }
        }
    }

    /// `animateWordLiftUp()`: Animates the lifting up of words.
    /// It moves each word upwards with a delay, creating a stacking animation effect.
    func animateWordLiftUp() {
        let liftAnimationDuration = 0.8
        let delayBetweenAnimations = 0.05

        for index in 1..<words.count {
            let delay = Double(index) * (liftAnimationDuration + delayBetweenAnimations)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(Animation.easeIn(duration: liftAnimationDuration)) {
                    yOffset -= wordHeight
                }
            }
        }
    }
}

#Preview {
    // Preview wrapper for StopThinkExistView
    return StopThinkExistViewPreviewWrapper()
    struct StopThinkExistViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()
        @State private var begin = false

        var body: some View {
            VStack(alignment: .center) {
                StopThinkExistView(begin: $begin)
            }
            .padding(.bottom, 8)
            .frame(height: 60)
            .mask(Rectangle().frame(height: 60))
            .onAppear {
                mockTimerManager.start()
            }
            .onChange(of: mockTimerManager.currentEvent) { _, event in
                handleEvent(at: event)
            }
            .environmentObject(mockTimerManager)
        }

        private func handleEvent(at second: TimerEvent) {
            switch second {
            case .eventAtSecond(1), .eventAtSecond(5):
                begin = true
            case .eventAtSecond(4), .eventAtSecond(8):
                begin = false
            default:
                break
            }
        }
    }
}
