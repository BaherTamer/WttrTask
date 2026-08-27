//
//  ErrorScreen.swift
//  WttrShared
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

struct ErrorScreen: View {
    // MARK: - Inputs
    let message: String
    let action: () -> Void
    
    // MARK: - Body
    var body: some View {
        ContentUnavailableView(
            label: titleLabel,
            description: descriptionText,
            actions: tryAgainButton
        )
    }
}

// MARK: - Components
extension ErrorScreen {
    private func titleLabel() -> some View {
        Label(
            "Error",
            systemImage: "exclamationmark.triangle"
        )
    }
    
    private func descriptionText() -> some View {
        Text(verbatim: message)
    }
    
    private func tryAgainButton() -> some View {
        Button(
            "Try again",
            action: action
        )
    }
}
