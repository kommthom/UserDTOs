//
//  IdentifierProtocol.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 02.10.24.
//

import Tagged
import Foundation

public protocol IdentifierProtocol {
	typealias Id = Tagged<(Self, id: ()), UUID>
	
	var id: Id? { get }
}
