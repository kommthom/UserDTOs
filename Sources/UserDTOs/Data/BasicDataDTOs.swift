//
//  BasicDataDTOs.swift
//
//
//  Created by Thomas Benninghaus on 17.05.24.
//

import Foundation

public final class BasicDataDTOs: Sendable {
    public static let mock: BasicDataDTOs = BasicDataDTOs()
	private static let uuids: [UUID] = [0...57].map { int in UUID()}
	public let users: [UserDTO]
    public let countries: [CountryDTO]
	public let locations: [LocationDTO]
    public let locales: [LocaleDTO]
    public let languages: [LanguageDTO]
	public let settings: [SettingDTO]
    
	public init(uuids: [UUID] = [0...64].map { int in UUID()}, users models: [UserDTO]? = nil, countries: [CountryDTO]? = nil, locations: [LocationDTO]? = nil, locales: [LocaleDTO]? = nil, languages: [LanguageDTO]? = nil, settings: [SettingDTO]? = nil) {
		let finalLocations = locations ?? BasicDataDTOs.locationsMock(uuids: uuids)
		self.locations = finalLocations
		let finalLocales = locales ?? BasicDataDTOs.localesMock(uuids: uuids)
		self.locales = finalLocales
		let finalLanguages = languages ?? BasicDataDTOs.languagesMock(uuids: uuids, locales: finalLocales)
		self.languages = finalLanguages
		let finalCountries = countries ?? BasicDataDTOs.countriesMock(uuids: uuids, locations: finalLocations, locales: finalLocales)
		self.countries = finalCountries
		let finalUsers = models ?? [BasicDataDTOs.userMock(uuid: BasicDataDTOs.uuids[35], locale: finalLocales[2], location:  finalLocations[1])]
		self.users = finalUsers
		let finalSettings = settings ?? BasicDataDTOs.settingsMock(uuids: uuids)
		self.settings = finalSettings
    }

	private static func userMock(uuid: UUID, locale: LocaleDTO, location: LocationDTO) -> UserDTO {
        let password = "system1!"
		return UserDTO(id: UserDTO.UserId(uuid), fullName: "Default User", email: "defaultuser@test.com", identifier: "system", imageURL: nil,  password: password, confirmPassword: password, isAdmin: false, isEmailVerified: true, locale: locale, location: location)
    }
	
	private static func countriesMock(uuids: [UUID], locations: [LocationDTO], locales: [LocaleDTO]) -> [CountryDTO] {
		return [
		CountryDTO(
			id: CountryDTO.CountryId(uuids[56]),
			name: "notSet",
			identifier: "raw",
			locales: LocalesDTO(locales: [locales[12]]),
			defaultLocale: locales[12],
			locations: LocationsDTO(locations: [locations[0]]),
			defaultLocation: locations[0],
			localization: { from in from }
		), // 0
		CountryDTO(
			id: CountryDTO.CountryId(uuids[0]),
			name: "germany",
			identifier: "germany",
			locales: LocalesDTO(locales: [locales[2]]),
			defaultLocale: locales[2],
			locations: LocationsDTO(locations: [locations[1], locations[2]]),
			defaultLocation: locations[1],
			localization: { from in from }
		), // 1
		CountryDTO(
			id: CountryDTO.CountryId(uuids[2]),
			name: "greatbritain",
			identifier: "greatbritain",
			locales: LocalesDTO(locales: [locales[0]]),
			defaultLocale: locales[0],
			locations: LocationsDTO(locations: [locations[3]]),
			defaultLocation: locations[3],
			localization: { from in from }
		), // 2
		CountryDTO(
			id: CountryDTO.CountryId(uuids[4]),
			name: "unitedstates",
			identifier: "unitedstates",
			locales: LocalesDTO(locales: [locales[1]]),
			defaultLocale: locales[1],
			locations: LocationsDTO(locations: [
				locations[4], locations[5], locations[6], locations[8], locations[9], locations[10]
			]),
			defaultLocation: locations[4],
			localization: { from in from }
		), // 3
		CountryDTO(
			id: CountryDTO.CountryId(uuids[6]),
			name: "france",
			identifier: "france",
			locales: LocalesDTO(locales: [locales[3]]),
			defaultLocale: locales[3],
			locations: LocationsDTO(locations: [locations[7]]),
			defaultLocation: locations[7],
			localization: { from in from }
		), // 4
		CountryDTO(
			id: CountryDTO.CountryId(uuids[29]),
			name: "southafrica",
			identifier: "southafrica",
			locales: LocalesDTO(locales: [locales[6], locales[7]]),
			defaultLocale: locales[6],
			locations: LocationsDTO(locations: [locations[11]]),
			defaultLocation: locations[11],
			localization: { from in from }
		), // 5
		CountryDTO(
			id: CountryDTO.CountryId(uuids[36]),
			name: "italy",
			identifier: "italy",
			locales: LocalesDTO(locales: [locales[8]]),
			defaultLocale: locales[8],
			locations: LocationsDTO(locations: [locations[12]]),
			defaultLocation: locations[12],
			localization: { from in from }
		), // 6
		CountryDTO(
			id: CountryDTO.CountryId(uuids[37]),
			name: "switzerland",
			identifier: "switzerland",
			locales: LocalesDTO(locales: [locales[9], locales[10], locales[11]]),
			defaultLocale: locales[9],
			locations: LocationsDTO(locations: [locations[14]]),
			defaultLocation: locations[14],
			localization: { from in from }
		), // 7
		CountryDTO(
			id: CountryDTO.CountryId(uuids[45]),
			name: "netherlands",
			identifier: "netherlands",
			locales: LocalesDTO(locales: [locales[4]]),
			defaultLocale: locales[4],
			locations: LocationsDTO(locations: [locations[13]]),
			defaultLocation: locations[13],
			localization: { from in from }
		) // 8
	] }
	
	private static func locationsMock(uuids: [UUID]) -> [LocationDTO] { [
		LocationDTO(id: LocationDTO.LocationId(uuids[57]), name:  "notSet", identifier: "raw", timeZone: "Europe/London", countryId: CountryDTO.CountryId(uuids[56]), localization: { from in from }), // 0
		LocationDTO(id: LocationDTO.LocationId(uuids[18]), name:  "Berlin", identifier: "berlin", timeZone: "Europe/London", countryId: CountryDTO.CountryId(uuids[0]), localization: { from in from }), // 1
		LocationDTO(id: LocationDTO.LocationId(uuids[19]), name:  "Köln", identifier: "cologne", timeZone: "Europe/Berlin", countryId: CountryDTO.CountryId(uuids[0]), localization: { from in from }), // 2
		LocationDTO(id: LocationDTO.LocationId(uuids[20]), name:  "London", identifier: "london", timeZone: "Europe/Berlin", countryId: CountryDTO.CountryId(uuids[2]), localization: { from in from }), // 3
		LocationDTO(id: LocationDTO.LocationId(uuids[21]), name:  "New York", identifier: "newyork", timeZone: "America/New_York", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 4
		LocationDTO(id: LocationDTO.LocationId(uuids[22]), name:  "Los Angeles", identifier: "losangeles", timeZone: "America/Los_Angeles", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 5
		LocationDTO(id: LocationDTO.LocationId(uuids[23]), name:  "Chicago", identifier: "chicago", timeZone: "America/Chicago", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 6
		LocationDTO(id: LocationDTO.LocationId(uuids[24]), name:  "Paris", identifier: "paris", timeZone: "Europe/Paris", countryId: CountryDTO.CountryId(uuids[6]), localization: { from in from }), // 7
		LocationDTO(id: LocationDTO.LocationId(uuids[25]), name:  "Hawaii", identifier: "hawaii", timeZone: "America/Hawaii", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 8
		LocationDTO(id: LocationDTO.LocationId(uuids[26]), name:  "Anchorage", identifier: "anchorage", timeZone: "America/Anchorage", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 9
		LocationDTO(id: LocationDTO.LocationId(uuids[27]), name:  "Denver", identifier: "denver", timeZone: "America/Denver", countryId: CountryDTO.CountryId(uuids[4]), localization: { from in from }), // 10
		LocationDTO(id: LocationDTO.LocationId(uuids[28]), name:  "Johannesburg", identifier: "johannesburg", timeZone: "Europe/Johannesburg", countryId: CountryDTO.CountryId(uuids[29]), localization: { from in from }), // 11
		LocationDTO(id: LocationDTO.LocationId(uuids[46]), name:  "Rome", identifier: "rome", timeZone: "Europe/Rome", countryId: CountryDTO.CountryId(uuids[36]), localization: { from in from }), // 12
		LocationDTO(id: LocationDTO.LocationId(uuids[47]), name:  "Amsterdam", identifier: "amsterdam", timeZone: "Europe/Amsterdam", countryId: CountryDTO.CountryId(uuids[45]), localization: { from in from }), // 13
		LocationDTO(id: LocationDTO.LocationId(uuids[48]), name:  "Genf", identifier: "geneve", timeZone: "Europe/Geneve", countryId: CountryDTO.CountryId(uuids[37]), localization: { from in from }) // 14
	] }
	
	private static func localesMock(uuids: [UUID]) -> [LocaleDTO] { [
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[3]), name: "en_GB", identifier: "en_GB", description: "English (GB)", languageId: LanguageDTO.LanguageId(uuids[10]), identifierEnum: .en_GB, localization: { from in from }), //0
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[5]), name: "en_US", identifier: "en_US", description: "English (US)", languageId: LanguageDTO.LanguageId(uuids[10]), identifierEnum: .en_US, localization: { from in from }), // 1
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[1]), name: "de_DE", identifier: "de_DE", description: "Deutsch (DE)", languageId: LanguageDTO.LanguageId(uuids[12]), identifierEnum: .de_DE, localization: { from in from }), // 2
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[7]), name: "fr_FR", identifier: "fr_FR", description: "Francaise (FR)", languageId: LanguageDTO.LanguageId(uuids[14]), identifierEnum: .fr_FR, localization: { from in from }), // 3
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[33]), name: "nl_NL", identifier: "nl_NL", description: "Nederlands (NL)", languageId: LanguageDTO.LanguageId(uuids[9]), identifierEnum: .nl_NL, localization: { from in from }), // 4
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[49]), name: "nl_ZA", identifier: "nl_ZA", description: "Nederlands (ZA)", languageId: LanguageDTO.LanguageId(uuids[9]), identifierEnum: .nl_ZA, localization: { from in from }), // 5
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[34]), name: "af_ZA", identifier: "af_ZA", description: "Afrikaans", languageId: LanguageDTO.LanguageId(uuids[11]), identifierEnum: .af_ZA, localization: { from in from }), // 6
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[53]), name: "en_ZA", identifier: "en_ZA", description: "English (ZA)", languageId: LanguageDTO.LanguageId(uuids[10]), identifierEnum: .en_ZA, localization: { from in from }), // 7
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[38]), name: "it_IT", identifier: "it_IT", description: "Italiano", languageId: LanguageDTO.LanguageId(uuids[39]), identifierEnum: .it_IT, localization: { from in from }), // 8
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[50]), name: "de_CH", identifier: "de_CH", description: "Deutsch (CH)", languageId: LanguageDTO.LanguageId(uuids[12]), identifierEnum: .de_CH, localization: { from in from }), // 9
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[51]), name: "fr_CH", identifier: "fr_CH", description: "Francaise (CH)", languageId: LanguageDTO.LanguageId(uuids[14]), identifierEnum: .fr_CH, localization: { from in from }), // 10
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[52]), name: "it_CH", identifier: "it_CH", description: "Italiano (CH)", languageId: LanguageDTO.LanguageId(uuids[39]), identifierEnum: .it_CH, localization: { from in from }), // 11
		LocaleDTO(id: LocaleDTO.LocaleId(uuids[16]), name: "raw", identifier: "notSet", description: "Not Set", languageId: LanguageDTO.LanguageId(uuids[8]), identifierEnum: .notSet, localization: { from in from }) // 12
	] }
	
	private static func languagesMock(uuids: [UUID], locales: [LocaleDTO]) -> [LanguageDTO] { [
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[8]), name: "NotSet", identifier: "notSet", locales: LocalesDTO(locales: [locales[12]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[10]), name: "English", identifier: "en", locales: LocalesDTO(locales: [locales[0], locales[1], locales[7]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[12]), name: "Deutsch", identifier: "de", locales: LocalesDTO(locales: [locales[2], locales[9]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[14]), name: "Francaise", identifier: "fr", locales: LocalesDTO(locales: [locales[3], locales[10]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[9]), name: "Nederlands", identifier: "nl", locales: LocalesDTO(locales: [locales[4], locales[5]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[11]), name: "Afrikaans", identifier: "af", locales: LocalesDTO(locales: [locales[6]]), identifierEnum: .notSet, localization: { $0 }),
		LanguageDTO(id: LanguageDTO.LanguageId(uuids[39]), name: "Italiano", identifier: "it", locales: LocalesDTO(locales: [locales[8], locales[11]]), identifierEnum: .notSet, localization: { $0 }),
	] }
	
	private static func settingsMock(uuids: [UUID]) -> [SettingDTO] { [
		SettingDTO(id: SettingDTO.SettingId(uuids[58]), sortOrder: 1, scope: .sidebarOptionsType, name: "settings.show_count", description: "settings.show_count", image: nil, valueType: .bool, boolValue: true, intValue: nil, stringValue: nil, idValue: nil, jsonValue: nil, localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[59]), sortOrder: 2, scope: .sidebarType, name: "settings.inbox", description: "settings.inbox", image: nil, valueType: .json, boolValue: true, intValue: nil, stringValue: "tasks/inbox", idValue: nil, jsonValue: nil, localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[60]), sortOrder: 3, scope: .sidebarType, name: "settings.today", description: "settings.today", image: nil, valueType: .string, boolValue: true, intValue: nil, stringValue: "tasks/today", idValue: nil, jsonValue: nil, localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[61]), sortOrder: 4, scope: .sidebarType, name: "settings.soon", description: "settings.soon", image: nil, valueType: .string, boolValue: true, intValue: nil, stringValue: "tasks/soon", idValue: nil, jsonValue: nil, localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[62]), sortOrder: 5, scope: .sidebarType, name: "settings.filter", description: "settings.filter", image: nil, valueType: .json, boolValue: true, intValue: nil, stringValue: nil, idValue: nil, jsonValue: "[]", localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[63]), sortOrder: 6, scope: .sidebarType, name: "settings.labels", description: "settings.labels", image: nil, valueType: .string, boolValue: true, intValue: nil, stringValue: "tags/index", idValue: nil, jsonValue: nil, localization: { $0 }),
		SettingDTO(id: SettingDTO.SettingId(uuids[64]), sortOrder: 7, scope: .sidebarType, name: "settings.done", description: "settings.done", image: nil, valueType: .string, boolValue: true, intValue: nil, stringValue: "tasks/done", idValue: nil, jsonValue: nil, localization: { $0 })
	] }
}
