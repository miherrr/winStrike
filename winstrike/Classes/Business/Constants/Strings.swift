// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Применить
  static let changePasswordButtonApply = L10n.tr("Localizable", "changePassword-button-apply")
  /// Войдите
  static let changePasswordEnterAccount = L10n.tr("Localizable", "changePassword-enter-account")
  /// Введите пароль, для авторизации по номеру
  static let changePasswordEnterPhone = L10n.tr("Localizable", "changePassword-enter-phone")
  /// Уже есть аккаунт?
  static let changePasswordHaveAccount = L10n.tr("Localizable", "changePassword-have-account")
  /// Новый пароль
  static let changePasswordPhonePlaceholder = L10n.tr("Localizable", "changePassword-phone-placeholder")
  /// Введите новый пароль
  static let changePasswordPhoneTitle = L10n.tr("Localizable", "changePassword-phone-title")
  /// Смена пароля
  static let changePasswordTitleText = L10n.tr("Localizable", "changePassword-title-text")
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
  /// Отправить
  static let helpMailButtonSend = L10n.tr("Localizable", "helpMail-button-send")
  /// Введите эл.адрес
  static let helpMailEmailPlaceholder = L10n.tr("Localizable", "helpMail-email-placeholder")
  /// Войдите
  static let helpMailEnterAccount = L10n.tr("Localizable", "helpMail-enter-account")
  /// Введите свой e-mail
  static let helpMailEnterEmail = L10n.tr("Localizable", "helpMail-enter-email")
  /// Уже есть аккаунт?
  static let helpMailHaveAccount = L10n.tr("Localizable", "helpMail-have-account")
  /// *На данный адрес будет выслана ссылка для смены пароля
  static let helpMailHelpText = L10n.tr("Localizable", "helpMail-help-text")
  /// Отправить e-mail
  static let helpMailTitleText = L10n.tr("Localizable", "helpMail-title-text")
  /// Далее
  static let helpPhoneButtonNext = L10n.tr("Localizable", "helpPhone-button-next")
  /// Отправить код
  static let helpPhoneButtonSendCode = L10n.tr("Localizable", "helpPhone-button-send-code")
  /// Войдите
  static let helpPhoneEnterAccount = L10n.tr("Localizable", "helpPhone-enter-account")
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
  /// Доступ к вашему аккаунту
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
