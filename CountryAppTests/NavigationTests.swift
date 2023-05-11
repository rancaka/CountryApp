//
//  NavigationTests.swift
//  CountryAppTests
//
//  Created by adityo.rancaka on 2023/04/21.
//

import XCTest
@testable import CountryApp
@testable import Router
@testable import Indonesia
@testable import Japan

class MockNavigationController: UINavigationController {

    var pushedVC: UIViewController!
    var presentedVC: UIViewController!

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedVC = viewController
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
    }
}

class JapanRouterTests: XCTestCase {

    func testRouter() {
        let navigationController = MockNavigationController()

        let coordinator = AppCoordinator(
            navigationController: navigationController,
            navigator: worldNavigator
        )

        coordinator.goTo(.indonesia(.jakarta))
        XCTAssertTrue(navigationController.pushedVC is Jakarta)

        coordinator.goTo(.indonesia(.bali))
        XCTAssertTrue(navigationController.presentedVC is Bali)

        coordinator.goTo(.japan(.tokyo(5)))
        XCTAssertTrue(navigationController.pushedVC is Tokyo)

        coordinator.goTo(.japan(.osaka))
        XCTAssertTrue(navigationController.pushedVC is Osaka)
    }
}
