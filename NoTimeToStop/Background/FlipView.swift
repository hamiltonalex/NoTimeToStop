//
//  FlipView.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `FlipView`: A SwiftUI View that creates a flip-flop circle scale up effect.
/// This view is used as the base for the background rotation effect in the OrbView file.
struct FlipView: View {
    // MARK: - Properties

    /// `timerManager`: An environment object used to access the shared timer state from the TimerManager.
    @EnvironmentObject var timerManager: TimerManager

    /// `reverseAnimation`: A state variable that controls the direction of the rotation animation.
    @State var reverseAnimation = false

    /// `changeColour`: A state variable that tracks the color theme state for the view.
    @State var changeColour = false

    /// `position`: A state variable that tracks the current position of the circle.
    @State var position = CGPoint.zero

    /// `circleWidth`: A state variable representing the width of the circle.
    @State var circleWidth = Double.zero

    /// `circle`: A constant representing a SwiftUI Circle view.
    /// This Circle view is used as a primary visual element in `FlipView`.
    /// Being a constant, it represents a fixed view structure that can be reused or modified through state variables and animations.
    let circle = Circle()

    /// `background`: A constant representing a SwiftUI Rectangle view.
    /// This Rectangle view is used as a background element in `FlipView`.
    /// Similar to `circle`, it's a fixed view structure that forms part of the view's layout and can interact with other UI elements.
    let background = Rectangle()

    // MARK: - Body

    /// The body of the `FlipView`.
    var body: some View {
        ZStack {
            // Background color change based on `changeColour`
            background
                .fill(changeColour ? .black : .white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Circle that flips and changes color
            circle
                .fill(changeColour ? .white : .black)
                .frame(width: circleWidth, height: circleWidth)
                .rotation3DEffect(
                    .degrees(reverseAnimation ? 180 : 0),
                    axis: (x: 1.0, y: 0.0, z: 0.0),
                    anchor: .top
                )
                .position(position)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(geometryReader)
        .onChange(of: timerManager.currentEvent) { _, event in
            handleEvent(at: event)
        }
    }

    // MARK: - Methods

    /// `handleEvent(at:)`: A  method to handle actions based on the specified `TimerEvent`.
    /// This method is designed to respond to different timer events, allowing the view to update and animate accordingly.
    /// - Parameter event: The `TimerEvent` that triggers specific actions or animations within the view.
    /// It is used to reverse animations, and update view states based on the timer's progress.
    func handleEvent(at event: TimerEvent) {
        switch event {
        case .eventAtSecond(3), .eventAtSecond(7):
            // Flip animation
            withAnimation(Animation.easeInOut(duration: timerManager.duration)) {
                self.reverseAnimation.toggle()
            }
        case .eventAtSecond(4), .eventAtSecond(8):
            // Change color
            self.changeColour.toggle()

        default:
            break
        }
    }

    /// `geometryReader`: A computed property that creates a GeometryReader view.
    /// GeometryReader is used to obtain the size and position of the parent view,
    /// which is crucial for laying out and animating this child view in relation to the parent's dimensions.
    var geometryReader: some View {
        GeometryReader { proxy in
            Color.clear
                .onAppear {
                    self.circleWidth = proxy.size.width * 0.5
                    self.position = CGPoint(x: proxy.size.width / 2, y: (proxy.size.height / 2) + (circleWidth / 2))
                }
        }
    }
}

#Preview {
    // Preview wrapper for FlipView
    return FlipViewPreviewWrapper()
    struct FlipViewPreviewWrapper: View {
        @StateObject private var mockTimerManager = TimerManager()

        var body: some View {
            FlipView()
                .onAppear {
                    mockTimerManager.start()
                }
                .environmentObject(mockTimerManager)
        }
    }
}
