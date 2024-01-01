//
//  OrbView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `OrbView`: A SwiftUI View that displays a rotating orb effect.
/// This view utilizes `FlipView` as a base and applies additional transformations to create the desired visual effect.
struct OrbView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state.
    /// This allows `OrbView` to respond to timer events managed by `TimerManager`.
    @EnvironmentObject var timerManager: TimerManager

    /// `rotationDegrees`: A state variable that controls the rotation angle of the orb.
    /// It is initially set to -45.0 degrees and will be updated based on timer events.
    @State var rotationDegrees = -45.0

    // MARK: - Body

    /// The body of `OrbView`.
    /// It defines the layout and behavior of the view, including the rotated and scaled `FlipView`.
    var body: some View {
        VStack {
            // Embeds `FlipView` and applies scale and rotation effects.
            FlipView()
                .scaleEffect(4) // Enlarges the `FlipView` by 4 times its original size.
                .rotationEffect(.degrees(rotationDegrees)) // Applies rotation based on `rotationDegrees`.
        }
        .offset(x: -70, y: AppConfig.yOffset) // Adjusts the position of the VStack.
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event) // Responds to changes in the current timer event.
        }
    }

    // MARK: - Methods

    /// `handleEvent(at:)`: Handles specific timer events to control the rotation of the orb.
    /// Depending on the event, it adjusts `rotationDegrees` to rotate the orb to specific angles.
    /// - Parameter event: The `TimerEvent` that triggers specific actions for the orb's rotation.
    func handleEvent(at event: TimerEvent) {
        switch event {
        case .eventAtSecond(2):
            rotationDegrees = -45.0 // Resets rotation to -45.0 degrees.
        case .eventAtSecond(3), .eventAtSecond(7):
            // Applies an animated rotation to a new angle based on the event.
            withAnimation(.easeInOut(duration: timerManager.duration)) {
                rotationDegrees = event == .eventAtSecond(3) ? -225 : -405
            }
        default:
            break // Does nothing for other events.
        }
    }
}

#Preview {
    // Preview wrapper for OrbView
    return OrbViewPreviewWrapper()
    struct OrbViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()

        var body: some View {
            OrbView()
                .onAppear {
                    mockTimerManager.start()
                }
                .environmentObject(mockTimerManager)
        }
    }
}
