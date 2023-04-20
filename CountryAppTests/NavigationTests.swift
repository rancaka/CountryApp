//
//  NavigationTests.swift
//  CountryAppTests
//
//  Created by adityo.rancaka on 2023/04/21.
//

import XCTest
@testable import CountryApp
@testable import Router
@testable import RouterDestination
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

        let router = Router(
            router: worldRouter,
            navigationController: navigationController
        )

        router.goTo(.indonesia(.jakarta))
        XCTAssertTrue(navigationController.pushedVC is Jakarta)

        router.goTo(.indonesia(.bali))
        XCTAssertTrue(navigationController.presentedVC is Bali)

        router.goTo(.japan(.tokyo(5)))
        XCTAssertTrue(navigationController.pushedVC is Tokyo)

        router.goTo(.japan(.presentTokyo(5)))
        XCTAssertTrue(navigationController.presentedVC is Tokyo)

        router.goTo(.japan(.osaka))
        XCTAssertTrue(navigationController.pushedVC is Osaka)
    }
}
