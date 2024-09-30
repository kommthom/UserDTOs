//
//  LocaleDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 15.05.24.
//

import Tagged
import Foundation

public struct LocaleDTO: Codable, Sendable, IdentifiedByStringLiteral, IdentifierLocalizedNameProtocol, LocalizedDescriptionProtocol {
	public typealias LocaleId = Tagged<(Self, id: ()), UUID>
	
	public var id: LocaleId?
	public var name: Name
	public var localizedName: LocalizedName
	public var description: Description
	public var localizedDescription: LocalizedDescription
    public var identifier: Identifier
	public var languageId: LanguageDTO.LanguageId
	public var identifierEnum: LocaleIdentifier
    
	public init(id: LocaleId? = nil, name: Name, identifier: Identifier, description: Description, languageId: LanguageDTO.LanguageId, identifierEnum: LocaleIdentifier, localization: @escaping @Sendable (String) -> String) {
        self.id = id
		self.name = name
		self.localizedName = LocalizedName(localization(name.rawValue))
		self.description = description
		self.localizedDescription = LocalizedDescription(localization(description.rawValue))
        self.identifier = identifier
		self.languageId = languageId
		self.identifierEnum = identifierEnum
    }
}
