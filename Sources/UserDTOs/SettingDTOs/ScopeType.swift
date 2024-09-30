//
//  ScopeType.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 31.01.24.
//

public enum ScopeType: String, Sendable, Codable, CustomStringConvertible, CaseIterable {
    case none = "none"
    case sidebarOptionsType = "SidebarOptions"
    case sidebarType = "Sidebar"

    public var description: String {
        self.rawValue
    }
}
