//
//  EtherScanRequestModel.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation

final public class EtherScanRequestModel: BaseRequestModel {

    let module: String
    let action: String
    let address: String
    let tag: Tag
    let apikey: String

    public init(module: String, action: String, address: String, tag: Tag, apikey: String) {
        self.module = module
        self.action = action
        self.address = address
        self.tag = tag
        self.apikey = apikey
    }

    override var parameters: [String : Any] {
        let parameters = [
            "module" : "\(module)",
            "action" : "\(action)",
            "address" : "\(address)",
            "tag" : "\(tag.rawValue)",
            "apikey" : "\(apikey)"
        ]
        return parameters
    }
}

public enum Tag: String {
    case latest
}
