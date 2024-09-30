//
//  LanguagesDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 15.05.24.
//

public struct LanguagesDTO: Sendable, Codable {
    public var languages: [LanguageDTO]

    public init(languages: [LanguageDTO] = []) {
        self.languages = languages
    }
}
