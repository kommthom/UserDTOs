//
//  LocaleIdentifier.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 26.03.24.
//

import Foundation

public enum LocaleIdentifier: String, Sendable, LocaleIdentifierProtocol {
	case en_GB = "en_GB"
    case en_US = "en_US"
    case de_DE = "de_DE"
    case fr_FR = "fr_FR"
    case nl_NL = "nl_NL"
    case af_ZA = "af_ZA"
    case nl_ZA = "nl_ZA"
    case en_ZA = "en_ZA"
    case de_CH = "de_CH"
    case fr_CH = "fr_CH"
    case it_CH = "it_CH"
    case it_IT = "it_IT"
    case other = "other"
    case notSet = "raw"
    
	public var language: LanguageIdentifier {
        return LanguageIdentifier(rawValue: String(self.rawValue.split(separator: "_")[0]))
    }
    
	public var identifier: String {
		self.rawValue
	}
    public var description: String {
		String(describing: self)
    }
    
    public var locale: Locale? {
        Locale(identifier: self.rawValue)
    }
}
