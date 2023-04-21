//
//  SceneDelegate.swift
//  CountryApp
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Router
import RouterDestination
import UIKit
import Indonesia
import Japan

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        UIApplication.router = Router(
            navigationController: navigationController,
            router: worldRouter
        )
        UIApplication.router.goTo(.home)

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

func worldRouter(_ destination: WorldDestination, navigationController: UINavigationController) {
    switch destination {
    case .home:
        navigationController.pushViewController(HomeViewController(), animated: true)
    case .japan(let japanDestination):
        japanRouter(japanDestination, navigationController: navigationController)
    case .indonesia(let indonesiaDestination):
        indonesiaRouter(indonesiaDestination, navigationController: navigationController)
    }
}
