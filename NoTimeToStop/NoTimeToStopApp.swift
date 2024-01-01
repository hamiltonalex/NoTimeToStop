//
//  NoTimeToStopApp.swift
//  NoTimeToStop
//
//  Created by Alex Hamilton on 20/12/2023.
//

import SwiftUI

/// `NoTimeToStopApp`: The main entry point of the SwiftUI application.
/// This structure conforms to the `App` protocol, which defines the configuration and behavior of the app.
@main
struct NoTimeToStopApp: App {
    // MARK: - Properties

    /// `timerManager`: A state object that manages timer events in the app.
    /// It is an instance of `TimerManager` which handles all the timer related logic.
    @StateObject var timerManager = TimerManager()

    // MARK: - Body

    /// `body`: Defines the content and behavior of the app's scene.
    /// Here we define a `WindowGroup` that will host the `ContentView`.
    /// `environmentObject`: We pass `timerManager` as an environment object to the `ContentView`.
    /// This makes `timerManager` accessible throughout the view hierarchy originating from `ContentView`.
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerManager)
        }
    }
}
