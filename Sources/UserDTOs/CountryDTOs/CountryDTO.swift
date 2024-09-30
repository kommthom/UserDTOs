//
//  CountryDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 16.05.24.
//

import Tagged
import Foundation

public struct CountryDTO: Sendable, Codable, IdentifierLocalizedNameProtocol, IdentifiedByStringLiteral {
	public typealias CountryId = Tagged<(Self, id: ()), UUID>
	
    public var id: CountryId?
    public var name: Name
	public var localizedName: LocalizedName
    public var identifier: Identifier
    public var locales: LocalesDTO
    public var defaultLocale: LocaleDTO
	public var locations: LocationsDTO
	public var defaultLocation: LocationDTO
    
    public init(id: CountryId? = nil, name: Name, identifier: Identifier, locales: LocalesDTO, defaultLocale: LocaleDTO, locations: LocationsDTO, defaultLocation: LocationDTO, localization: @escaping @Sendable (String) -> String) {
        self.id = id
        self.name = name
		self.localizedName = LocalizedName(localization(name.rawValue))
        self.identifier = identifier
        self.locales = locales
        self.defaultLocale = defaultLocale
		self.locations = locations
		self.defaultLocation = defaultLocation
    }
}
