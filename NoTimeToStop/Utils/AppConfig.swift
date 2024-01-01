//
//  AppConfig.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 21/12/2023.
//

import Foundation
import UIKit

/// Global app configuration settings
struct AppConfig {
    /// Duration of animations in seconds
    static let animationDuration: Double = 0.3

    /// Delay before starting animations in seconds
    static let animationDelay: Double = 0.1

    /// Delay for subtitle animations in seconds
    static let animationDelaySubtitle: Double = 0.04

    /// Total duration of the animation sequence in seconds
    static let totalAnimationDuration = 8

    /// Step duration in the animation sequence in seconds
    static let animationStep: Double = 2.0

    /// Dynamic font size based on device screen width
    static var titleFontSize: CGFloat {
        // Support iPhone SE size
        return UIScreen.main.bounds.height <= 736 ? 70 : 80
    }

    /// Position adjustment of the VStack
    static var yOffset: CGFloat {
        // Support iPhone SE size
        return UIScreen.main.bounds.height <= 736 ? -50 : -90
    }
}
