//
//  SplashViewModelTests.swift
//  pnpTests
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class SplashViewModelTests: XCTestCase {
    private var sut: SplashViewModel!
    private var coordinator: MockSplashCoordinator!

    override func setUp() {
        sut = SplashViewModel()
        coordinator = MockSplashCoordinator()
        sut.coordinatorDelegate = coordinator
    }

    override func tearDown() {
        sut = nil
        coordinator = nil
    }

    func testGoToPrelogin() {
        // When
        sut.goToPreLogin()

        // Then
        XCTAssertTrue(coordinator.goToPreloginCalled)
    }
}

fileprivate final class MockSplashCoordinator: SplashCoordinatorDelegate {
    var goToPreloginCalled = false

    func goToPreLogin() {
        goToPreloginCalled = true
    }
}
