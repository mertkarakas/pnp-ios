//
//  BaseRequestModel.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation
import UIKit

enum RequestHTTPMethod: String {
    case get = "get"
    case post = "post"
}

open class BaseRequestModel: NSObject {

    // MARK: - Properties

    var path: String {
        return ""
    }
    var parameters: [String: Any] {
        return [:]
    }
    var headers: [String: String] {
        return [:]
    }
    var method: RequestHTTPMethod {
        return body.isEmpty ? RequestHTTPMethod.get : RequestHTTPMethod.post
    }
    var body: [String: Any?] {
        return [:]
    }
}

// MARK: - Public Functions

extension BaseRequestModel {

    public func urlRequest() -> URLRequest? {

        var components = URLComponents()

        var queryItems: [URLQueryItem] = []

        let otherParams: [URLQueryItem] = parameters.map({
            return URLQueryItem(name: $0.key, value: $0.value as? String)
        })
        queryItems.append(contentsOf: otherParams)

        components.scheme = ServiceConstants.scheme
        components.host = ServiceConstants.baseURL
        components.path = ServiceConstants.apiPath + path
        components.queryItems = queryItems

        guard let url = components.url else {
            return nil
        }
        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue

        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        if method == RequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
            }
        }

        return request
    }
}
