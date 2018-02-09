// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  typealias AssetColorTypeAlias = NSColor
  typealias Image = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  typealias AssetColorTypeAlias = UIColor
  typealias Image = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

@available(*, deprecated, renamed: "ImageAsset")
typealias AssetType = ImageAsset

struct ImageAsset {
  fileprivate var name: String

  var image: Image {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

struct ColorAsset {
  fileprivate var name: String

  #if swift(>=3.2)
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
  #endif
}

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
enum Asset {
  enum Help {
    static let book = ImageAsset(name: "book")
    static let mail = ImageAsset(name: "mail")
    static let phone = ImageAsset(name: "phone")
  }
  static let clubOneExample = ImageAsset(name: "clubOneExample")
  enum HomeScreen {
    static let homeMessage = ImageAsset(name: "homeMessage")
    static let moneyHand = ImageAsset(name: "moneyHand")
  }
  enum Winstrike {
    static let backChevron = ImageAsset(name: "back-chevron")
    static let buttonDown = ImageAsset(name: "buttonDown")
    static let buttonUp = ImageAsset(name: "buttonUp")
    static let check = ImageAsset(name: "check")
    static let england = ImageAsset(name: "england")
    static let facebook = ImageAsset(name: "facebook")
    static let handshake = ImageAsset(name: "handshake")
    static let homeMenu = ImageAsset(name: "homeMenu")
    static let instagram = ImageAsset(name: "instagram")
    static let label = ImageAsset(name: "label")
    static let like = ImageAsset(name: "like")
    static let logout = ImageAsset(name: "logout")
    static let maps = ImageAsset(name: "maps")
    static let profileDumb = ImageAsset(name: "profileDumb")
    static let rectangle = ImageAsset(name: "rectangle")
    static let russia = ImageAsset(name: "russia")
    static let steam = ImageAsset(name: "steam")
    static let telegram = ImageAsset(name: "telegram")
    static let twitch = ImageAsset(name: "twitch")
    static let vk = ImageAsset(name: "vk")
  }

  // swiftlint:disable trailing_comma
  static let allColors: [ColorAsset] = [
  ]
  static let allImages: [ImageAsset] = [
    Help.book,
    Help.mail,
    Help.phone,
    clubOneExample,
    HomeScreen.homeMessage,
    HomeScreen.moneyHand,
    Winstrike.backChevron,
    Winstrike.buttonDown,
    Winstrike.buttonUp,
    Winstrike.check,
    Winstrike.england,
    Winstrike.facebook,
    Winstrike.handshake,
    Winstrike.homeMenu,
    Winstrike.instagram,
    Winstrike.label,
    Winstrike.like,
    Winstrike.logout,
    Winstrike.maps,
    Winstrike.profileDumb,
    Winstrike.rectangle,
    Winstrike.russia,
    Winstrike.steam,
    Winstrike.telegram,
    Winstrike.twitch,
    Winstrike.vk,
  ]
  // swiftlint:enable trailing_comma
  @available(*, deprecated, renamed: "allImages")
  static let allValues: [AssetType] = allImages
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

extension Image {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX) || os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

extension AssetColorTypeAlias {
  #if swift(>=3.2)
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: asset.name, bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
  #endif
}

private final class BundleToken {}
