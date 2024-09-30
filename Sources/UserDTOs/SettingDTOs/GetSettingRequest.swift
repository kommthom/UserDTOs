//
//  GetSettingsRequest.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 02.02.24.
//

public struct GetSettingsRequest: Sendable, Codable {
    public let scope: ScopeType
    
    public init(scope: ScopeType) {
        self.scope = scope
    }
}
