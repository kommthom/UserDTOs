//
//  LocalizedDescriptionProtocol.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 18.05.24.
//

import Tagged

public protocol LocalizedDescriptionProtocol {
	typealias Description = Tagged<(Self, description: ()), String>
	typealias LocalizedDescription = Tagged<(Self, localizedDescription: ()), String>
	
	var description: Description { get }
	var localizedDescription: LocalizedDescription { get }
}
