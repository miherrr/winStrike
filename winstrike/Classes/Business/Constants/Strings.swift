// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Доступ к вашему аккаунту
  static let helperAccessAccount = L10n.tr("Localizable", "helper-access-account")
  /// Справочный центер
  static let helperHelpCenter = L10n.tr("Localizable", "helper-help-center")
  /// Справочный центер Win Strike
  static let helperHelpCenterWinStrike = L10n.tr("Localizable", "helper-help-center-winStrike")
  /// Отправить эл.письмо
  static let helperSendMail = L10n.tr("Localizable", "helper-send-mail")
  /// Отправить SMS
  static let helperSendSms = L10n.tr("Localizable", "helper-send-sms")
  /// Помощь при входе
  static let helperTitleText = L10n.tr("Localizable", "helper-title-text")
  /// Далее
  static let helpPhoneButtonNext = L10n.tr("Localizable", "helpPhone-button-next")
  /// Отправить код
  static let helpPhoneButtonSendCode = L10n.tr("Localizable", "helpPhone-button-send-code")
  /// Подтвердить
  static let helpPhoneConfirmCode = L10n.tr("Localizable", "helpPhone-confirm-code")
  /// Отправить код
  static let helpPhoneEnterAccount = L10n.tr("Localizable", "helpPhone-enter-account")
  /// Войдите
  static let helpPhoneEnterAccountEnter = L10n.tr("Localizable", "helpPhone-enter-account-enter")
  /// Введите код подтверждения
  static let helpPhoneEnterCode = L10n.tr("Localizable", "helpPhone-enter-code")
  /// Код подтверждения
  static let helpPhoneEnterCodePlaceholser = L10n.tr("Localizable", "helpPhone-enter-code-placeholser")
  /// Уже есть аккаунт?
  static let helpPhoneHaveAccount = L10n.tr("Localizable", "helpPhone-have-account")
  /// *Сюда будет выслан код подтверждения
  static let helpPhonePhoneHelp = L10n.tr("Localizable", "helpPhone-phone-help")
  /// RU +7
  static let helpPhonePhonePlaceholder = L10n.tr("Localizable", "helpPhone-phone-placeholder")
  /// *Отправить код повторно через %@ сек
  static func helpPhonePhoneSendCodeHint(_ p1: String) -> String {
    return L10n.tr("Localizable", "helpPhone-phone-send-code-hint", p1)
  }
  /// Реальный номер телефона
  static let helpPhoneRealPhone = L10n.tr("Localizable", "helpPhone-real-phone")
  /// Отправить код
  static let helpPhoneSendCodeRepeat = L10n.tr("Localizable", "helpPhone-send-code-repeat")
  /// Отправить SMS 
  static let helpPhoneTitleText = L10n.tr("Localizable", "helpPhone-title-text")
  /// Ещё нет аккаунта?
  static let registrationDontHaveTitle = L10n.tr("Localizable", "registration-dont-have-title")
  /// Забыли данные для входа?
  static let registrationForgetButton = L10n.tr("Localizable", "registration-forget-button")
  /// Вход
  static let registrationLoginButton = L10n.tr("Localizable", "registration-login-button")
  /// Войти через
  static let registrationLoginSocialTitle = L10n.tr("Localizable", "registration-login-social-title")
  /// Номер телефона или эл.адрес
  static let registrationLoginTitle = L10n.tr("Localizable", "registration-login-title")
  /// Пароль
  static let registrationPasswordTitle = L10n.tr("Localizable", "registration-password-title")
  /// Зарегистрируйтесь
  static let registrationRegistrationButton = L10n.tr("Localizable", "registration-registration-button")
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
