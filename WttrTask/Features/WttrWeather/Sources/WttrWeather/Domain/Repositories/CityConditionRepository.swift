//
//  CityConditionRepository.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

protocol CityConditionRepository {
    func getCondition(city: String) async throws -> Condition?
}
