//
//  EtherScanService.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

final public class EtherScanService: BaseService {

    public func getInfo(module:String, action:String, address: String, tag: Tag, apiKey:String, completion: @escaping(Swift.Result<EtherScanResponseModel, ServiceErrorModel>) -> Void) {

        serviceManager.sendRequest(request: EtherScanRequestModel(module: module, action: action, address: address, tag: tag, apikey: apiKey)) { (result) in
            completion(result)
        }
    }
}
