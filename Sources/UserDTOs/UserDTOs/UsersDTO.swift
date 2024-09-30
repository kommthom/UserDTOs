//
//  UsersDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 06.02.24.
//

public struct UsersDTO: Sendable, Codable {
    public var users: [UserDTO]

    public init(users: [UserDTO] = []) {
        self.users = users
    }
}
