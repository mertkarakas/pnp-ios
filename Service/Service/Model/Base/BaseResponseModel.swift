//
//  BaseResponseModel.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation

struct BaseResponseModel<T: Codable>: Codable {

    // MARK: - Properties

    var rawData: Data?
    var statusMessage: String?
    var error: ServiceErrorModel {
        return ServiceErrorModel(statusMessage ?? "")
    }
    var data: T? {
        guard let rawData = rawData else { return nil }
        let jsonDecoder = JSONDecoder()
        let data = try? jsonDecoder.decode(T.self, from: rawData)
        if data != nil {
            return data
        }
        return nil
    }
    var json: String? {
           guard let rawData = rawData else { return nil }
           return String(data: rawData, encoding: String.Encoding.utf8)
       }

    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        statusMessage = (try? keyedContainer.decode(String.self, forKey: CodingKeys.statusMessage)) ?? ""
    }
}

extension BaseResponseModel {

    private enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
    }
}
