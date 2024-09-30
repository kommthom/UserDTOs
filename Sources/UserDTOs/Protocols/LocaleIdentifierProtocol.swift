//
//  LocaleIdentifierProtocol.swift
//  UserDTOs
//
//  Created by Thomas Benninghaus on 26.08.24.
//

import Foundation

public protocol LocaleIdentifierProtocol: Sendable, Codable, CustomStringConvertible, CaseIterable, RawRepresentable where RawValue == String {
	var language: LanguageIdentifier { get }
	var description: RawValue { get }
	var identifier: String { get }
	var locale: Locale? { get }
}

public extension LocaleIdentifierProtocol {
	var language: LanguageIdentifier {
		return LanguageIdentifier(rawValue: String(self.description.split(separator: "_")[0]))
	}
	
	var description: RawValue {
		self.rawValue
	}
	
	var identifier: String {
		locale?.identifier ?? self.rawValue
	}
	
	var locale: Locale { //LocaleIdentifierProtocol { get }
		Locale(identifier: self.description)
	}

	func weekDay(_ date: Date) -> String {
		return date.formatted(.dateTime
			.weekday(.wide)
			.locale(locale))
	}

	var allMonthNames: [String] {
		guard let _ = locale else { return Month.allCases.map { $0.rawValue } }
		var calendar = Calendar.current
		calendar.locale = locale
		return calendar.monthSymbols
	}
	
	var shortMonthNames: [String]  {
		guard let _ = locale else { return Month.allCases.map { $0.rawValue } }
		var calendar = Calendar.current
		calendar.locale = locale
		return calendar.shortMonthSymbols
	}
	
	var allWeekdayNames: [String] {
		guard let _ = locale else { return Weekday.allCases.map { $0.rawValue } }
		var calendar = Calendar.current
		calendar.locale = locale
		return calendar.weekdaySymbols
	}
	
	var startingFirstWeekdayNames: [String] {
		let firstWeekday = Calendar.current.firstWeekday - 1
		let names = self.allWeekdayNames
		return firstWeekday == 0 ? names : Array(names[firstWeekday..<names.count]) + names[0..<firstWeekday]
	}
	
	var shortWeekdayNames: [String] {
		guard let _ = locale else { return [0...7].map { "\($0)" } }
		var calendar = Calendar.current
		calendar.locale = locale
		return calendar.shortWeekdaySymbols
	}
}
