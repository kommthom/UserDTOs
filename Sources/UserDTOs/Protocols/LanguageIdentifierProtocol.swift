//
//  LanguageIdentifierProtocol.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 26.08.24.
//

public protocol LanguageIdentifierProtocol: Codable, Sendable, CustomStringConvertible, CaseIterable, RawRepresentable where RawValue == Int {
	init(rawValue: String)
	var identifier: String { get }
}
