//
//  IdentifierLocalizedNameProtocol.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 25.08.24.
//

import Tagged
import Foundation

public protocol IdentifierLocalizedNameProtocol: IdentifierProtocol {
	typealias Name = Tagged<(Self, name: ()), String>
	typealias LocalizedName = Tagged<(Self, localizedName: ()), String>
	
	var name: Name { get }
	var localizedName: LocalizedName { get }
}
