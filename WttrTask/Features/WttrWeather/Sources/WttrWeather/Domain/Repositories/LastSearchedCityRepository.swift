//
//  LastSearchedCityRepository.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

protocol LastSearchedCityRepository {
    func getCity() -> String?
    func saveCity(_ city: String)
}
