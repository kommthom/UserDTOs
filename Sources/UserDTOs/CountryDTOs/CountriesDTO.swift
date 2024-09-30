//
//  CountriesDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 16.05.24.
//

public struct CountriesDTO: Sendable, Codable {
    public var countries: [CountryDTO]

    public init(countries: [CountryDTO] = []) {
        self.countries = countries
    }
}
