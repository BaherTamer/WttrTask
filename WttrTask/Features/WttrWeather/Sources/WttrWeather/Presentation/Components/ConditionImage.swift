//
//  ConditionImage.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI
import WttrShared

struct ConditionImage: View {
    // MARK: - Inputs
    let iconURL: String
    
    // MARK: - Body
    var body: some View {
        AsyncImage(
            url: URL(string: iconURL),
            content: imageView,
            placeholder: ProgressView.init
        )
    }
}

// MARK: - Components
extension ConditionImage {
    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
            .frame(height: Sizes.s64)
            .padding(.vertical, Spaces.s8)
    }
}
