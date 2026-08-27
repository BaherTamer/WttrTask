//
//  CurrentConditionDTO.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

struct CurrentConditionDTO: Decodable {
    let temperatureCelsius: String?
    let weatherCode: String?
    let weatherDesc: [ValueDTO]?
    let weatherIconUrl: [ValueDTO]?

    enum CodingKeys: String, CodingKey {
        case temperatureCelsius = "temp_C"
        case weatherCode
        case weatherDesc
        case weatherIconUrl
    }
}
