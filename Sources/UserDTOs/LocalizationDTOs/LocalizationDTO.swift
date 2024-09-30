//
//  LocalizationDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 24.08.24.
//

import Tagged
import Foundation

public struct LocalizationDTO: Sendable, Codable, IdentifiedByStringLiteral {
	public typealias LocalizationId = Tagged<Self, UUID>
	public typealias ModelType = Tagged<(Self, modelType: ()), String>
	public typealias EnumKey = Tagged<(Self, enumKey: ()), Int>
	public typealias Key = Tagged<(Self, key: ()), String>
	
	public var id: LocalizationId?
	public var modelType: ModelType
	public var identifier: Identifier
	public var enumKey: EnumKey?
	public var key: Key
	public var value: String?
	public var pluralized: [String: String]?
	
	public init(id: LocalizationId? = nil, modelType: ModelType = "localizations", identifier: Identifier, enumKey: EnumKey? = nil, key: Key, value: String?, pluralized: [String: String]? = nil) {
		self.id = id
		self.modelType = modelType
		self.identifier = identifier
		self.enumKey = enumKey
		self.key = key
		self.value = value
		self.pluralized = pluralized
	}
}

extension LocalizationDTO: Comparable {
	public static func < (lhs: LocalizationDTO, rhs: LocalizationDTO) -> Bool {
		lhs.identifier.rawValue < rhs.identifier.rawValue || (lhs.identifier.rawValue == rhs.identifier.rawValue && lhs.key.rawValue < rhs.key.rawValue)
	}
}

extension Tagged<(LocalizationDTO, identifier: ()), String> {
	/// Returns `true` if the locale identifier contains both, language and country code
	public var hasCountryCode: Bool {
		return self.rawValue.components(separatedBy: "-").count == 2
	}

	/// Returns language code from the locale identifier string.
	/// For locales which contains a country code (en-US, de-CH), the country code is removed.
	public var languageCode: String {
		let components = self.rawValue.components(separatedBy: "-")
		return components.count == 2 ? components.first! : self.rawValue
	}
}
