//
//  SceneDelegate.swift
//  CountryApp
//
//  Created by adityo.rancaka on 2023/04/21.
//

import Router
import UIKit
import Indonesia
import Japan

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        UIApplication.coordinator = AppCoordinator(
            navigationController: navigationController,
            router: worldRouter
        )
        UIApplication.coordinator.goTo(.home)

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
        japanNavigator(japanDestination, navigationController: navigationController)
    case .indonesia(let indonesiaDestination):
        indonesiaNavigator(indonesiaDestination, navigationController: navigationController)
    }
}
