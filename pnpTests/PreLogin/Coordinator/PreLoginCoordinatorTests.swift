//
//  PreLoginCoordinatorTests.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class PreLoginCoordinatorTests: XCTestCase {
    private var sut: PreLoginCoordinator!
    private var controller: UINavigationController!

    override func setUp() {
        controller = UINavigationController()
        sut = PreLoginCoordinator(navController: controller)
    }

    override func tearDown() {
        controller = nil
        sut = nil
    }
    
    func testCoordinatorStart() {
        // When
        sut.start()

        // Then
        XCTAssertTrue(controller.viewControllers.first is PreLoginViewController)
    }
}

