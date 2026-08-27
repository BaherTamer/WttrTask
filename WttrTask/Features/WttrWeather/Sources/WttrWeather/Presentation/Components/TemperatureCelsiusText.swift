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
    
    // MARK: - Body
    var body: some View {
        Text(celsius, format: .number)
            .font(.largeTitle)
            .fontWeight(.thin)
    }
}
