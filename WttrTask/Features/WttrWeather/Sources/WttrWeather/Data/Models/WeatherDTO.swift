//
//  WeatherDTO.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import CoreModule

struct WeatherDTO: Domainable {
    let currentCondition: [CurrentConditionDTO]?
    let nearestArea: [NearestAreaDTO]?

    enum CodingKeys: String, CodingKey {
        case currentCondition = "current_condition"
        case nearestArea = "nearest_area"
    }
}

// MARK: - Mapping Functions
extension WeatherDTO {
    func toDomain() -> Condition? {
        guard
            let condition = currentCondition?.first
        else { return nil }
        let area = nearestArea?.first
        return Condition(
            cityName: area?.areaName?.first?.value ?? "Unknown",
            countryName: area?.country?.first?.value ?? "Unknown",
            iconURL: condition.weatherIconUrl?.first?.value,
            temperatureCelsius: condition.temperatureCelsius?.asInt ?? 0,
            conditionText: condition.weatherDesc?.first?.value ?? "N/A"
        )
    }
}
