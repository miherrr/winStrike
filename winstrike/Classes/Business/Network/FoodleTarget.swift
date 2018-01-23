//
// Created by User on 03.08.17.
// Copyright (c) 2017 Heads and Hands. All rights reserved.
//

import Moya
import CoreLocation
import Alamofire
import UIKit

enum FoodleTarget {
    case logout

    var isRequiredAuth: Bool {
            return true
    }
}

extension FoodleTarget: TargetType {

    var baseURL: URL {
        return Configurations.current.apiBaseURL
    }

    var path: String {
        switch self {
//        case .adwardsGeo, .postAdwardsGeo:
//            return "me/awards/geo"
        case .logout:
            return "logout"
        }
    }

    var method: Moya.Method {
        switch self {
//        case :
//            return .get
//        case :
//            return .delete
//        case :
//            return .patch
//        case :
//            return .put
        default:
            return .post
        }
    }

    var parameters: [String: Any]? {
        switch self {
//        case let .postAdwardsGeo(lat, lon):
//            var parameters: [String: Any] = [:]
//            parameters["lat"] = lat
//            parameters["lon"] = lon
//            return parameters
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        switch self {
//        case :
//            return JsonArrayEncoding.default
//        case :
//            return URLEncoding(destination: .methodDependent)
        default:
            return URLEncoding(destination: .queryString)
        }
    }
    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
//        case let .editeProfile(image, _, _, _):
//            if let newImage = image {
//                if let data: Data = UIImagePNGRepresentation(newImage) {
//                    return .upload(.multipart([MultipartFormData(
//                        provider: .data(data),
//                        name: "image",
//                        fileName: "photo.jpg",
//                        mimeType: "image/jpeg")]))
//                } else if let data: Data = UIImageJPEGRepresentation(newImage, 1.0) {
//                    return .upload(.multipart([MultipartFormData(
//                        provider: .data(data),
//                        name: "image",
//                        fileName: "photo.jpg",
//                        mimeType: "image/jpeg")]))
//                }
//            }
//            return .request
        default:
            return .request
        }
    }
}

struct JsonArrayEncoding: Moya.ParameterEncoding {
    public static var `default`: JsonArrayEncoding { return JsonArrayEncoding() }

    /// Creates a URL request by encoding parameters and applying them onto an existing request.
    ///
    /// - parameter urlRequest: The request to have parameters applied.
    /// - parameter parameters: The parameters to apply.
    ///
    /// - throws: An `AFError.parameterEncodingFailed` error if encoding fails.
    ///
    /// - returns: The encoded request.
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var req = try urlRequest.asURLRequest()
        if let dic = parameters {
            let json = try JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.prettyPrinted)
            req.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            req.httpBody = json
        }
        return req
    }

}

private func loadDataFromBundle(with name: String) -> Data {
    guard let path = Bundle.main.path(forResource: name, ofType: "json"),
          let data = FileManager.default.contents(atPath: path) else {
        fatalError("Example file not found for name: \(name)")
    }
    return data
}
