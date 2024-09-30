//
//  UserConstants.swift
//
//
//  Created by Thomas Benninghaus on 26.03.24.
//

import Foundation

public struct UserConstants {
    public static var `default`: UserConstants.Default { UserConstants.Default() }
    public struct Default {
		public var user: UserDTO { BasicDataDTOs.mock.users[0]}
		public var locale: LocaleDTO { user.locale }
		public var localeIdentifier: LocaleIdentifier { locale.identifierEnum }
		public var languageIdentifier: LanguageIdentifier { language.identifierEnum }
        public var timeZone = TimeZone(identifier: "UTC")
        public var language: LanguageDTO {
			BasicDataDTOs.mock.languages.first { language in
				language.id == locale.languageId
			} ?? BasicDataDTOs.mock.languages.first!
		}
    }
}
