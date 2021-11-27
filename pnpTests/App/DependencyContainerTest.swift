//
//  DependencyContainerTest.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import XCTest
@testable import pnp
@testable import Service

final class DependencyContainerTest: XCTestCase {
    private var sut: DependencyContainer!
    private var window: UIWindow!

    override func setUp() {
        window = UIWindow()
        sut = DependencyContainer(window: window, serviceManager: ServiceManager())
    }

    func testInit() {
        XCTAssertEqual(sut.window, window)
    }
}
