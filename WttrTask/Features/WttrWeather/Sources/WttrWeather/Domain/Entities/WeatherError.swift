//
//  WeatherError.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

enum WeatherError: Error {
    case noInternet
    case cityNotFound
    case serviceUnavailable
}

extension WeatherError {
    var message: String {
        switch self {
        case .noInternet:
            "No Internet Connection, check your connection and try again."
        case .cityNotFound:
            "City Not Found, Check the spelling and try another name."
        case .serviceUnavailable:
            "The weather service isn't responding right now. Please try again."
        }
    }
}
