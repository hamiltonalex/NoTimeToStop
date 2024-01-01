//
//  TimerManager.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 25/12/2023.
//

import Combine
import Foundation

/// `TimerManager`: Manages a timer and its associated events in the application.
/// This class handles the logic for starting, pausing, and resetting the timer, as well as triggering events based on time.
class TimerManager: ObservableObject {
    // MARK: - Properties

    /// The current event triggered by the timer.
    @Published var currentEvent: TimerEvent = .none

    /// The step interval for the timer's animation.
    let duration = AppConfig.animationStep

    /// The total duration of the timer's interval.
    let totalInterval = AppConfig.totalAnimationDuration

    /// Tracks the current second of the timer.
    var currentSecond = 0
    
    /// The Combine timer used to trigger events.
    var timer: AnyCancellable?

    // MARK: - Timer Control Methods

    /// Starts the timer.
    /// The timer updates the `currentSecond` every second and checks for any timer events.
    func start() {
        currentSecond = 0

        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    /// Stops the timer.
    /// This method cancels the timer and resets the current time.
    func stop() {
        currentSecond = 0
        timer?.cancel()
        timer = nil
    }

    // MARK: - Helper Methods

    /// Handles the ticking of the timer.
    /// This method is called every second and updates the `currentSecond`.
    /// It also triggers any events based on the current time.
    func tick() {
        self.currentSecond = (self.currentSecond % self.totalInterval) + 1
        self.currentEvent = TimerEvent.from(second: self.currentSecond)
    }
}


