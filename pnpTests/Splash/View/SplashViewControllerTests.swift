//
//  SplashViewControllerTests.swift
//  pnpTests
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class SplashViewControllerTests: XCTestCase {
    private var sut: SplashViewController!
    private var viewModel: MockViewModel!
    private var coordinator: MockSplashCoordinator!

    override func setUp() {
        sut = SplashViewController()
        viewModel = MockViewModel()
        coordinator = MockSplashCoordinator()
        viewModel.coordinatorDelegate = coordinator
        sut.viewModel = viewModel
        sut.loadView()
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        coordinator = nil
    }

    func testLoad() {
        XCTAssertNotNil(sut.viewModel)
    }
}

fileprivate final class MockViewModel: SplashViewModelProtocol {
    weak var coordinatorDelegate: SplashCoordinatorDelegate?

    var goToPreLoginCalled = false

    func goToPreLogin() {
        goToPreLoginCalled = true
    }
}

fileprivate final class MockSplashCoordinator: SplashCoordinatorDelegate {
    func goToPreLogin() {
    }
}
