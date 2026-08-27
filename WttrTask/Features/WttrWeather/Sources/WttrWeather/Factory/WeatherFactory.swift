//
//  WeatherFactory.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import FactoryKit
import SwiftUI

// MARK: - Presentation Layer
@MainActor
extension Container {
    public var weatherScreen: Factory<AnyView> {
        self {
            let viewModel = self.weatherViewModel()
            let screen = WeatherScreen(
                viewModel: viewModel
            )
            return AnyView(screen)
        }
    }
    
    private var weatherViewModel: Factory<WeatherViewModelImp> {
        self {
            WeatherViewModelImp(
                cityConditionUseCase: self.cityConditionUseCase(),
                lastSearchedCityUseCase: self.lastSearchedCityUseCase()
            )
        }
    }
}

// MARK: - Domain Layer
extension Container {
    private var cityConditionUseCase: Factory<CityConditionUseCase> {
        self {
            CityConditionUseCaseImp(
                cityConditionRepository: self.cityConditionRepository(),
                lastSearchedCityRepository: self.lastSearchedCityRepository()
            )
        }
    }

    private var lastSearchedCityUseCase: Factory<LastSearchedCityUseCase> {
        self {
            LastSearchedCityUseCaseImp(
                repository: self.lastSearchedCityRepository()
            )
        }
    }
}

// MARK: - Data Layer
extension Container {
    private var cityConditionRepository: Factory<CityConditionRepository> {
        self {
            CityConditionRepositoryImp(
                networkService: self.networkService()
            )
        }
    }

    private var lastSearchedCityRepository: Factory<LastSearchedCityRepository> {
        self {
            LastSearchedCityRepositoryImp()
        }
    }
}
