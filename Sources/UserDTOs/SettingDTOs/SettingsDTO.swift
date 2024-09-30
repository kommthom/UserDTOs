//
//  SettingsDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 03.02.24.
//

public struct SettingsDTO {
    public var settings: [SettingDTO]

    /// Create empty context
    public init(settings: [SettingDTO] = []) {
        self.settings = settings
    }
}
