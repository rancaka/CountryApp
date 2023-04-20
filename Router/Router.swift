//
//  Router.swift
//  Router
//
//  Created by adityo.rancaka on 2023/04/21.
//

import UIKit

public final class Router<Destination> {

    private let navigationController: UINavigationController
    private let router: (Destination, UINavigationController) -> Void

    public init(router: @escaping (Destination, UINavigationController) -> Void, navigationController: UINavigationController) {
        self.router = router
        self.navigationController = navigationController
    }

    public func goTo(_ destination: Destination) {
        router(destination, navigationController)
    }

    public func scope<LocalDestination>(
        _ toGlobalDestination: @escaping (LocalDestination) -> Destination
    ) -> Router<LocalDestination> {
        Router<LocalDestination>(
            router: { [weak self] localDestination, _ in
                guard let self else { return }
                self.router(toGlobalDestination(localDestination), self.navigationController)
            },
            navigationController: navigationController
        )
    }
}
