//
//  BaseService.swift
//  Service
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

public class BaseService {
    var serviceManager: ServiceManager

    public init(manager: ServiceManager) {
        self.serviceManager = manager
    }
}
