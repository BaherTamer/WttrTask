//
//  TemperatureCelsiusText.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

struct TemperatureCelsiusText: View {
    // MARK: - Inputs
    let celsius: Int
    
    // MARK: - Variables
    private var temperature: Measurement<UnitTemperature> {
        Measurement(value: celsius.asDouble, unit: .celsius)
    }
    
    // MARK: - Body
    var body: some View {
        Text(
            temperature,
            format: .measurement(width: .abbreviated)
        )
        .font(.largeTitle)
        .fontWeight(.thin)
    }
}
