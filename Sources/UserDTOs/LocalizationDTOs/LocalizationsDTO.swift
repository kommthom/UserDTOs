//
//  LocalizationsDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 24.05.24.
//

public struct LocalizationsDTO: Sendable, Codable {
    public var localizations: [LocalizationDTO]

    public init(localizations: [LocalizationDTO] = []) {
        self.localizations = localizations
    }
}
