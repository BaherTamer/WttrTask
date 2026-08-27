//
//  WeatherScreen.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import SwiftUI
import WttrShared

public struct WeatherScreen<ViewModel: WeatherViewModel>: View {
    // MARK: - Dependencies
    @State private var viewModel: ViewModel
    
    // MARK: - Life Cycle
    public init(viewModel: ViewModel) {
        self._viewModel = State(initialValue: viewModel)
    }
    
    // MARK: - Body
    public var body: some View {
        NavigationStack {
            ScrollView {
                stateView
            }
            .defaultScrollAnchor(.center, for: .alignment)
            .scrollBounceBehavior(.basedOnSize)
            .scrollIndicators(.hidden)
            .searchable(text: $viewModel.city)
            .onSubmit(of: .search, viewModel.onSubmit)
        }
    }
}

// MARK: - State Views
extension WeatherScreen {
    @ViewBuilder
    private var stateView: some View {
        switch viewModel.state {
        case .initial:
            initialView
        case .loading:
            loadingView
        case .loaded:
            contentView
        case .error(let message):
            errorView(message: message)
        }
        
    }
    
    private var initialView: some View {
        WeatherEmptyView()
            .onAppear(perform: viewModel.onInit)
    }
    
    private var loadingView: some View {
        WeatherLoadingView()
    }
    
    private func errorView(message: String) -> some View {
        ErrorScreen(
            message: message,
            action: viewModel.onRetry
        )
    }
    
    @ViewBuilder
    private var contentView: some View {
        if let condition = viewModel.condition {
            WeatherCardView(condition: condition)
        }
    }
}
