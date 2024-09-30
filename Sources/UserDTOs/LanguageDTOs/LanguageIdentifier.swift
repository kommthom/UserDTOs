//
//  LanguageIdentifier.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 09.01.24.
//

public enum LanguageIdentifier: Int, Sendable, LanguageIdentifierProtocol {
    case en = 1 //"en"
    case de = 2 //"de"
    case fr = 3 // "fr"
    case nl = 4 // "nl"
    case af = 5 // "af"
    case it = 6 // "it"
    case notSet = 0 //"raw"
    
    public init(rawValue: String) {
        self = switch rawValue {
            case "en": .en
            case "de": .de
            case "fr": .fr
            case "nl": .nl
            case "af": .af
            case "it": .it
            default: .notSet
        }
    }
    
	public var identifier: String {
        switch self {
            case .en: "en"
            case .de: "de"
            case .fr: "fr"
            case .nl: "nl"
            case .af: "af"
            case .it: "it"
            default: "raw"
        }
    }
    
    public var description: String {
        String(describing: self)
    }
}
