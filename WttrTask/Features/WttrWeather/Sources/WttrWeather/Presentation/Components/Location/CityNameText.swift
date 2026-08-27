//
//  CityNameText.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

struct CityNameText: View {
    // MARK: - Inputs
    let name: String
    
    // MARK: - Body
    var body: some View {
        Text(verbatim: name)
            .font(.title2)
            .fontWeight(.semibold)
    }
}
