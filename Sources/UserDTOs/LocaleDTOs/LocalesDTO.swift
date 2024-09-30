//
//  LocalesDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 15.05.24.
//

public struct LocalesDTO: Codable, Sendable {
    public var locales: [LocaleDTO]

    public init(locales: [LocaleDTO] = []) {
        self.locales = locales
    }
}
