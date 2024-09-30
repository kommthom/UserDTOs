//
//  UserDTO.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 01.02.24.
//

import Tagged
import Foundation

public struct UserDTO: Codable, Sendable, IdentifierProtocol, IdentifiedByStringLiteral {
	public typealias UserId = Tagged<(Self, id: ()), UUID>
	
    public var id: UserId?
    public var fullName: String
    public var email: String
	public var identifier: Identifier
    public var imageURL: String?
    public var password: String
    public let confirmPassword: String?
    public var isAdmin: Bool
    public var isEmailVerified: Bool
    public var locale: LocaleDTO
    public var location: LocationDTO
    
    public init(id: Id? = nil, fullName: String, email: String, identifier: Identifier, imageURL: String?, password: String, confirmPassword: String? = nil, isAdmin: Bool = false, isEmailVerified: Bool = false, locale: LocaleDTO, location: LocationDTO) {
        self.id = id
        self.fullName = fullName
        self.email = email
		self.identifier = identifier
        self.imageURL = imageURL
        self.password = password
        self.confirmPassword = confirmPassword ?? password
        self.isAdmin = isAdmin
        self.isEmailVerified = isEmailVerified
        self.locale = locale
        self.location = location
    }
}
