//
//  CityConditionRepositoryImp.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import NetworkModule

final class CityConditionRepositoryImp: CityConditionRepository {
    // MARK: - Dependencies
    private let networkService: NetworkService
    
    // MARK: - Life Cycle
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}

// MARK: - Core Functions
extension CityConditionRepositoryImp {
    func getCondition(city: String) async throws -> Condition? {
        do {
            let endpoint = CityConditionEndpoint(city: city)
            let data = try await networkService.request(with: endpoint)
            let weather = try data.decode(WeatherDTO.self)
            return weather.toDomain()
        } catch let error as NetworkError {
            throw mapError(error)
        } catch {
            print("ERROR: \(error.localizedDescription)")
            throw WeatherError.serviceUnavailable
        }
    }
}

// MARK: - Private Helpers
extension CityConditionRepositoryImp {
    private func mapError(_ error: NetworkError) -> WeatherError {
        switch error {
        case .noConnection:
            .noInternet
        case .unacceptableStatus:
            .cityNotFound
        case .invalidURL, .transportFailure, .invalidData:
            .serviceUnavailable
        }
    }
}
