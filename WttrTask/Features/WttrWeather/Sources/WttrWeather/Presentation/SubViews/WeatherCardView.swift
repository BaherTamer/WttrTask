//
//  WeatherCardView.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI
import WttrShared

struct WeatherCardView: View {
    // MARK: - Inputs
    let condition: Condition
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Spaces.s16) {
            LocationNameView(
                city: condition.cityName,
                country: condition.countryName
            )
            
            conditionImage
            
            TemperatureCelsiusText(
                celsius: condition.temperatureCelsius
            )
            
            ConditionText(
                title: condition.conditionText
            )
        }
    }
}


// MARK: - Components
extension WeatherCardView {
    @ViewBuilder
    private var conditionImage: some View {
        if let iconURL = condition.iconURL {
            ConditionImage(iconURL: iconURL)
        }
    }
}
