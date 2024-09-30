//
//  SettingValueType.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 31.01.24.
//

public enum SettingValueType: String, Sendable, Codable, CustomStringConvertible, CaseIterable {
    case bool = "Bool"
    case int = "Int"
    case string = "String"
    case id = "Id"
    case json = "json"
    
    public var description: String {
        self.rawValue
    }
}
