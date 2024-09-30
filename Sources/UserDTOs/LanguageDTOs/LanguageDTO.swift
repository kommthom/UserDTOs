//
//  LanguageDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 15.05.24.
//

import Tagged
import Foundation

public struct LanguageDTO: Codable, Sendable, IdentifierLocalizedNameProtocol, IdentifiedByStringLiteral {
	public typealias LanguageId = Tagged<(Self, id: ()), UUID>
	
	public var id: LanguageId?
    public var name: Name
	public var localizedName: LocalizedName
    public var identifier: Identifier
    public var locales: LocalesDTO
	public var identifierEnum: LanguageIdentifier
    
    public init(id: LanguageId? = nil, name: Name, identifier: Identifier, locales: LocalesDTO, identifierEnum: LanguageIdentifier, localization: @escaping @Sendable (String) -> String) {
        self.id = id
        self.name = name
		self.localizedName = LocalizedName(localization(name.rawValue))
        self.identifier = identifier
        self.locales = locales
		self.identifierEnum = identifierEnum
    }
}
