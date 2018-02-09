// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {
  /// Применить
  static let changePasswordButtonApply = L10n.tr("Localizable", "changePassword-button-apply")
  /// Введите пароль, для авторизации по номеру
  static let changePasswordEnterPhone = L10n.tr("Localizable", "changePassword-enter-phone")
  /// Новый пароль
  static let changePasswordPhonePlaceholder = L10n.tr("Localizable", "changePassword-phone-placeholder")
  /// Введите новый пароль
  static let changePasswordPhoneTitle = L10n.tr("Localizable", "changePassword-phone-title")
  /// Смена пароля
  static let changePasswordTitleText = L10n.tr("Localizable", "changePassword-title-text")
  /// Вам был отправлен код
  static let confirmPasswordCodeSent = L10n.tr("Localizable", "confirmPassword-code-sent")
  /// Введите 6-значный код, который был отправлен на номер %@.
  static func confirmPasswordEnterCodeHint(_ p1: String) -> String {
    return L10n.tr("Localizable", "confirmPassword-enter-code-hint", p1)
  }
  /// Введите код подтверждения
  static let confirmPasswordEnterCodePlaceholder = L10n.tr("Localizable", "confirmPassword-enter-code-placeholder")
  /// Далее
  static let confirmPasswordNextButton = L10n.tr("Localizable", "confirmPassword-next-button")
  /// Последний шаг регистрации
  static let enterUserInfoLastStep = L10n.tr("Localizable", "enterUserInfo-last-step")
  /// Имя и фамилия
  static let enterUserInfoNamePlaceholder = L10n.tr("Localizable", "enterUserInfo-name-placeholder")
  /// Поехали!
  static let enterUserInfoNextBtn = L10n.tr("Localizable", "enterUserInfo-next-btn")
  /// Регистрируясь, вы соглашаетесь с нашими\n
  static let enterUserInfoRules1 = L10n.tr("Localizable", "enterUserInfo-rules1")
  /// Условиями
  static let enterUserInfoRules2 = L10n.tr("Localizable", "enterUserInfo-rules2")
  /// и
  static let enterUserInfoRules3 = L10n.tr("Localizable", "enterUserInfo-rules3")
  /// Политикой конфиденциальности
  static let enterUserInfoRules4 = L10n.tr("Localizable", "enterUserInfo-rules4")
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
  /// Введите свой e-mail
  static let helpMailEnterEmail = L10n.tr("Localizable", "helpMail-enter-email")
  /// *На данный адрес будет выслана ссылка для смены пароля
  static let helpMailHelpText = L10n.tr("Localizable", "helpMail-help-text")
  /// Отправить e-mail
  static let helpMailTitleText = L10n.tr("Localizable", "helpMail-title-text")
  /// Далее
  static let helpPhoneButtonNext = L10n.tr("Localizable", "helpPhone-button-next")
  /// Отправить код
  static let helpPhoneButtonSendCode = L10n.tr("Localizable", "helpPhone-button-send-code")
  /// Подтвердить
  static let helpPhoneConfirmCode = L10n.tr("Localizable", "helpPhone-confirm-code")
  /// Введите код подтверждения
  static let helpPhoneEnterCode = L10n.tr("Localizable", "helpPhone-enter-code")
  /// Код подтверждения
  static let helpPhoneEnterCodePlaceholser = L10n.tr("Localizable", "helpPhone-enter-code-placeholser")
  /// +7
  static let helpPhonePhoneCountryCode = L10n.tr("Localizable", "helpPhone-phone-country-code")
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
  /// Войдите
  static let parentEnterAccount = L10n.tr("Localizable", "parent-enter-account")
  /// Уже есть аккаунт?
  static let parentHaveAccount = L10n.tr("Localizable", "parent-have-account")
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
