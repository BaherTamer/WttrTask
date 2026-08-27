//
//  App.swift
//  WttrTask
//
//  Created by Baher Tamer on 27/08/2026.
//

import CoreModule
import SwiftUI
import WttrWeather

@main struct WttrApp: App {
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            Resolver.resolve(\.weatherScreen)
        }
    }
}
