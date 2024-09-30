//
//  LocationsDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 16.05.24.
//

public struct LocationsDTO: Sendable, Codable {
    public var locations: [LocationDTO]

    public init(locations: [LocationDTO] = []) {
        self.locations = locations
    }
}
