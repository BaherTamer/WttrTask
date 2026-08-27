//
//  ErrorScreen.swift
//  WttrShared
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI

public struct ErrorScreen: View {
    // MARK: - Inputs
    private let message: String
    private let action: () -> Void
    
    // MARK: - Life Cycle
    public init(
        message: String,
        action: @escaping () -> Void
    ) {
        self.message = message
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
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
