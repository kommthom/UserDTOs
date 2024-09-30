//
//  IdentifiedByStringLiteral.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 25.08.24.
//

import Tagged

public protocol IdentifiedByStringLiteral {
	typealias Identifier = Tagged<(Self, identifier: ()), String>
	
	var identifier: Identifier { get }
}
