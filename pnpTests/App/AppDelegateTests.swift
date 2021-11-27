//
//  AppDelegateTests.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp

final class AppDelegateTests: XCTestCase {
    private var sut: AppDelegate!

    override func setUp() {
        sut = UIApplication.shared.delegate as? AppDelegate
    }

    func testLoadApp() {
        XCTAssertTrue(sut.window?.rootViewController is UINavigationController)
    }

}
