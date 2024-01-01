//
//  TimerEvent.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 30/12/2023.
//

import Foundation

/// `TimerEvent`: Enum representing specific events triggered by the timer.
/// It provides a way to handle different time-based events within the app.
enum TimerEvent: Equatable {
    /// Represents an event occurring at a specific second.
    case eventAtSecond(Int)
    /// Represents no event.
    case none

    /// Creates a TimerEvent based on the current second.
    /// - Parameter second: The current second of the timer.
    /// - Returns: A `TimerEvent` corresponding to the given second, or `.none` if the second does not match any event.
    static func from(second: Int) -> TimerEvent {
        return (0...AppConfig.totalAnimationDuration).contains(second) ? .eventAtSecond(second) : .none
    }
}

