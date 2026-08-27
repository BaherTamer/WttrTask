//
//  WeatherEmptyView.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

struct WeatherEmptyView: View {
    // MARK: - Body
    var body: some View {
        ContentUnavailableView(
            "Which city?",
            systemImage: "magnifyingglass",
            description: descriptionText
        )
    }
}

// MARK: - Components
extension WeatherEmptyView {
    private var descriptionText: Text {
        Text("Search for a city to see its current weather.")
    }
}
