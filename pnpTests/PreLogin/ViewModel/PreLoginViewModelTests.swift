//
//  PreLoginViewModelTests.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class PreLoginViewModelTests: XCTestCase {
    private var sut: PreLoginViewModel!
    private var coordinator: MockPreLoginCoordinator!

    override func setUp() {
        sut = PreLoginViewModel()
        coordinator = MockPreLoginCoordinator()
        sut.coordinatorDelegate = coordinator
    }

    override func tearDown() {
        sut = nil
        coordinator = nil
    }

    func testShowCampaign() {
        // When
        sut.showCampaignAction()

        // Then
        XCTAssertTrue(coordinator.goToCampaignsCalled)
    }

    func testGoToSignIn() {
        // When
        sut.goToSignIn()

        // Then
        XCTAssertTrue(coordinator.goToSignInCalled)
    }
}

fileprivate final class MockPreLoginCoordinator: PreLoginCoordinatorDelegate {

    var goToCampaignsCalled = false
    var goToSignInCalled = false

    func goToCampaigns() {
        goToCampaignsCalled = true
    }

    func goToSignIn() {
        goToSignInCalled = true
    }
}
