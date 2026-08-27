//
//  LocationNameView.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI
import WttrShared

struct LocationNameView: View {
    // MARK: - Inputs
    let city: String
    let country: String
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: Spaces.s4) {
            CityNameText(name: city)
            countryNameText
        }
    }
}


// MARK: - Components
extension LocationNameView {
    @ViewBuilder
    private var countryNameText: some View {
        if !country.isEmpty {
            CountryNameText(name: country)
        }
    }
}
