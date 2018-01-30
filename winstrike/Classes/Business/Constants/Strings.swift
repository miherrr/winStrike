// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Далее
  static let startNextButtonTitle = L10n.tr("Localizable", "start-next-button-title")
  /// Выберете город
  static let startTitleChooseCity = L10n.tr("Localizable", "start-title-choose-city")
  /// English
  static let startTitleChooseEnglish = L10n.tr("Localizable", "start-title-choose-english")
  /// Выберете язык
  static let startTitleChooseLanguage = L10n.tr("Localizable", "start-title-choose-language")
  /// Русский
  static let startTitleChooseRussian = L10n.tr("Localizable", "start-title-choose-russian")
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
