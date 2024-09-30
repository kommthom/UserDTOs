//
//  SettingDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 31.01.24.
//

import Foundation
import Tagged

public struct SettingDTO: Sendable, Codable, LocalizedDescriptionProtocol {
	public typealias SettingId = Tagged<(Self, id: ()), UUID>
	
	public var id: SettingId?
    public var sortOrder: Int
    public var scope: ScopeType
    public var name: String
	public var description: Description
	public var localizedDescription: LocalizedDescription
    public var image: String?
    public var valueType: SettingValueType
    public var boolValue: Bool?
    public var intValue: Int?
    public var stringValue: String?
    public var idValue: UUID?
    public var jsonValue: String?

	public init(id: SettingId?, sortOrder: Int, scope: ScopeType, name: String, description: Description, image: String?, valueType: SettingValueType, boolValue: Bool?, intValue: Int?, stringValue: String?, idValue: UUID?, jsonValue: String?, localization: @escaping @Sendable (String) -> String) {
        self.id = id
        self.sortOrder = sortOrder
        self.scope = scope
        self.name = name
        self.description = description
        self.localizedDescription = LocalizedDescription(localization(description.rawValue))
        self.image = image
        self.valueType = valueType
        self.boolValue = boolValue
        self.intValue = intValue
        self.stringValue = stringValue
        self.idValue = idValue
        self.jsonValue = jsonValue
    }
}
