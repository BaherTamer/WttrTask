//
//  CityConditionUseCase.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

protocol CityConditionUseCase {
    func execute(city: String) async throws -> Condition?
}

final class CityConditionUseCaseImp: CityConditionUseCase {
    // MARK: - Dependencies
    private let cityConditionRepository: CityConditionRepository
    private let lastSearchedCityRepository: LastSearchedCityRepository
    
    // MARK: - Life Cycle
    init(
        cityConditionRepository: CityConditionRepository,
        lastSearchedCityRepository: LastSearchedCityRepository
    ) {
        self.cityConditionRepository = cityConditionRepository
        self.lastSearchedCityRepository = lastSearchedCityRepository
    }
}

// MARK: - Core Functions
extension CityConditionUseCaseImp {
    func execute(city: String) async throws -> Condition? {
        let condition = try await cityConditionRepository.getCondition(city: city)
        lastSearchedCityRepository.saveCity(city)
        return condition
    }
}
