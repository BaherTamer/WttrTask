//
//  LastSearchedCityRepositoryImp.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

import Foundation

final class LastSearchedCityRepositoryImp: LastSearchedCityRepository {
    // MARK: - Variables
    private let key = "lastSearchedCity"
}

// MARK: - Core Functions
extension LastSearchedCityRepositoryImp {
    func getCity() -> String? {
        UserDefaults.standard.string(forKey: key)
    }

    func saveCity(_ city: String) {
        UserDefaults.standard.set(city, forKey: key)
    }
}
