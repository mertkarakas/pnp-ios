//
//  SplashCoordinatorTests.swift
//  pnpTests
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class SplashCoordinatorTests: XCTestCase {
    private var sut: SplashCoordinator!
    private var controller: UINavigationController!

    override func setUp() {
        controller = UINavigationController()
        sut = SplashCoordinator(navController: controller)
    }

    func testCoordinatorStart() {
        // When
        sut.start()

        // Then
        XCTAssertTrue(controller.viewControllers.first is SplashViewController)
    }
}

