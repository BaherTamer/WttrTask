//
//  WeatherViewModel.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import CoreModule
import Observation

protocol WeatherViewModel: ViewModel {
    var city: String { get set }
    var condition: Condition? { get }

    func onSubmit()
}

@Observable
final class WeatherViewModelImp: WeatherViewModel {
    // MARK: - States
    var state: ViewState = .initial
    var city: String = ""
    private(set) var condition: Condition?
    
    // MARK: - Dependencies
    private let cityConditionUseCase: CityConditionUseCase
    private let lastSearchedCityUseCase: LastSearchedCityUseCase
    
    // MARK: - Life Cycle
    init(
        cityConditionUseCase: CityConditionUseCase,
        lastSearchedCityUseCase: LastSearchedCityUseCase
    ) {
        self.cityConditionUseCase = cityConditionUseCase
        self.lastSearchedCityUseCase = lastSearchedCityUseCase
    }
}

// MARK: - Base Functions
extension WeatherViewModelImp {
    func onInit() {
        getLastSearchedCity()
        getWeatherCondition()
    }
    
    func onRetry() {
        getWeatherCondition()
    }
}

// MARK: - Core Functions
extension WeatherViewModelImp {
    func onSubmit() {
        getWeatherCondition()
    }
}

// MARK: - Private Helpers
extension WeatherViewModelImp {
    private func getLastSearchedCity() {
        guard
            let city = lastSearchedCityUseCase.execute()
        else { return }
        self.city = city
    }
    
    private func getWeatherCondition() {
        guard
            !city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        else { return }
        Task { [weak self, city] in
            do {
                self?.state = .loading
                let condition = try await self?.cityConditionUseCase.execute(city: city)
                if let condition {
                    self?.condition = condition
                    self?.state = .loaded
                } else {
                    self?.state = .error("City not found, please search with another one.")
                }
            } catch let error as WeatherError {
                self?.state = .error(error.message)
            } catch {
                self?.state = .error("Something went wrong, please try again later.")
            }
        }
    }
}
