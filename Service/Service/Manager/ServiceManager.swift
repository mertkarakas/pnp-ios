//
//  ServiceManager.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation

public class ServiceManager: NSObject {

    public override init() {}

    public func sendRequest<T: Codable>(request: BaseRequestModel, completion: @escaping(Swift.Result<T, ServiceErrorModel>) -> Void) {

        guard let urlRequest = request.urlRequest() else {
          return
        }
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, var responseModel = try? JSONDecoder().decode(BaseResponseModel<T>.self, from: data) else {
                completion(Result.failure(ServiceErrorModel(ErrorMessagesConstants.mapModelError)))
                return
            }

            responseModel.rawData = data

            if let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(responseModel.error))
            }

        }.resume()
    }
}
