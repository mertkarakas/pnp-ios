//
//  DependencyContainer.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit
import Service

final class DependencyContainer {

    let window: UIWindow
    let serviceManager: ServiceManager
    let coreDataManager: CoreDataManager

    init(window: UIWindow, serviceManager: ServiceManager, coreDataManager: CoreDataManager) {
        self.window = window
        self.serviceManager = serviceManager
        self.coreDataManager = coreDataManager
    }
}
