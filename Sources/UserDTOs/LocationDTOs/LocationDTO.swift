//
//  LocationDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 16.05.24.
//

import Tagged
import Foundation

public struct LocationDTO: Sendable, Codable, IdentifierLocalizedNameProtocol, IdentifiedByStringLiteral {
	public typealias LocationId = Tagged<(Self, id: ()), UUID>
	
	public var id: LocationId?
    public var name: Name
	public var localizedName: LocalizedName
    public var identifier: Identifier
    public var timeZone: String
	public var countryId: CountryDTO.CountryId

	public init(id: LocationId? = nil, name: Name, identifier: Identifier, timeZone: String, countryId: CountryDTO.CountryId, localization: @escaping @Sendable (String) -> String = { $0 } ) {
        self.id = id
        self.name = name
		self.localizedName = LocalizedName(localization(name.rawValue))
        self.identifier = identifier
        self.timeZone = timeZone
        self.countryId = countryId
    }
}
