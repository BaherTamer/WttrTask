//
//  ConditionText.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

struct ConditionText: View {
    // MARK: - Inputs
    let title: String
    
    // MARK: - Body
    var body: some View {
        Text(verbatim: title)
            .font(.headline)
    }
}
