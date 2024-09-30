//
//  ModelType.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 24.08.24.
//

import Foundation

public enum ModelType: String, CustomStringConvertible, CaseIterable, Sendable, Codable {
//	case attachments = "attachments"
	case countries = "countries"
//	case emailtokens = "emailtokens"
//	case histories = "histories"
	case languages = "languages"
	case locales = "locales"
	case localizations = "localizations"
	case locations = "locations"
//	case passwordtokens = "passwordtokens"
//	case projects = "projects"
//	case refreshtokens = "refreshtokens"
//	case repetitions = "repetitions"
//	case rules = "rules"
	case settings = "settings"
//	case tags = "tags"
//	case tasks = "tasks"
//	case timeperiods = "timeperiods"
//	case uploads = "uploads"
//	case users = "users"
//	case keywords = "keywords"
//	case actiontypes = "actiontypes"
//	case attachmenttypes = "attachmenttypes"
//	case customdateformattypes = "customdateformattypes"
//	case historytypes = "historytypes"
//	case intervalkeywords = "intervalkeywords"
//	case keywordtypes = "keywordtypes"
	case languageidentifiers = "languageidentifiers"
	case localeidentifiers = "localeidentifiers"
	case localizationenums = "localizationenums"
//	case localizationresults = "localizationresults"
//	case notificationtypes = "notificationtypes"
//	case priorities = "priorities"
//	case ruletypes = "ruletypes"
	case scopetypes = "scopetypes"
	case settingvaluetypes = "settingvaluetypes"
	
	public var description: String { rawValue }
}
