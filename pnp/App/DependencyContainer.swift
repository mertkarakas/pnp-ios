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
    private let serviceManager: ServiceManager

    init(window: UIWindow, serviceManager: ServiceManager) {
        self.window = window
        self.serviceManager = serviceManager
    }
}
