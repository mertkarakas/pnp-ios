//
//  PreLoginViewControllerTests.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class PreLoginViewControllerTests: XCTestCase {
    private var sut: PreLoginViewController!
    private var viewModel: MockViewModel!

    override func setUp() {
        sut = PreLoginViewController()
        viewModel = MockViewModel()
        sut.viewModel = viewModel
        sut.loadView()
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
    }

    func testLoad() {
        // When
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.viewModel.banners.count, viewModel.banners.count)
    }
}

fileprivate final class MockViewModel: PreLoginViewModelProtocol {
    var banners: [String] = []

    var showCampaignActionCalled = false
    var goToSignInCalled = false

    func showCampaignAction() {
        showCampaignActionCalled = true
    }

    func goToSignIn() {
        goToSignInCalled = true
    }
}
