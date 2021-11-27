//
//  AppCoordinatorTests.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp
@testable import Service

final class AppCoordinatorTests: XCTestCase {
    private var sut: AppCoordinator!

    override func setUp() {
        let dependency = DependencyContainer(window: UIWindow(), serviceManager: ServiceManager())
        sut = AppCoordinator(dependency: dependency)
    }

    func testCoordinatorStart() {
        // When
        sut.start()

        // Then
        let splash = sut.childCoordinators.first(where: {$0 is SplashCoordinator})
        XCTAssertNotNil(splash)
    }
}
