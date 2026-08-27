//
//  LastSearchedCityUseCase.swift
//  WttrWeather
//
//  Created by Baher Tamer on 27/08/2026.
//

protocol LastSearchedCityUseCase {
    func execute() -> String?
}

final class LastSearchedCityUseCaseImp: LastSearchedCityUseCase {
    // MARK: - Dependencies
    private let repository: LastSearchedCityRepository

    // MARK: - Life Cycle
    init(repository: LastSearchedCityRepository) {
        self.repository = repository
    }
}

// MARK: - Core Functions
extension LastSearchedCityUseCaseImp {
    func execute() -> String? {
        repository.getCity()
    }
}
